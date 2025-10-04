#!/bin/bash
# Enhanced Benchmark script for dynamic PVC provisioning
set -euo pipefail

# --- CONFIGURATION ---
# List of StorageClasses to benchmark. Add any you want to test here.
STORAGE_CLASSES_TO_TEST=("longhorn-delete" "local-storage")

DRY_RUN=false
VERBOSE=true

# Track created resources for cleanup
RUNNING_PODS=()
CREATED_PVCS=()

# --- SIGNAL HANDLING ---
cleanup_on_exit() {
    log_warn "Cleaning up benchmark resources due to script interruption..."
    # Clean up pods first
    if [[ ${#RUNNING_PODS[@]} -gt 0 ]]; then
        for pod in "${RUNNING_PODS[@]}"; do
            if [[ -n "$pod" ]]; then
                log_debug "Deleting pod: $pod"
                kubectl delete pod "$pod" --ignore-not-found=true --now >/dev/null 2>&1
            fi
        done
    fi
    # Clean up PVCs
    if [[ ${#CREATED_PVCS[@]} -gt 0 ]]; then
        for pvc in "${CREATED_PVCS[@]}"; do
            if [[ -n "$pvc" ]]; then
                log_debug "Deleting PVC: $pvc"
                kubectl delete pvc "$pvc" --ignore-not-found=true --now >/dev/null 2>&1
            fi
        done
    fi
}

trap cleanup_on_exit EXIT
trap 'log_warn "Interrupted by user"; exit 130' INT TERM

# --- FIO COMMAND ---
FIO_CMD="fio --name=randrw --ioengine=libaio --rw=randrw \
         --bs=4k --size=1G --numjobs=4 --runtime=60 --group_reporting \
         --filename=/mnt/testfile"

# --- HELPERS AND LOGGING ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_debug() { if [[ "$VERBOSE" == "true" ]]; then echo -e "${BLUE}[DEBUG]${NC} $1"; fi; }

usage() {
    cat << EOF
Usage: $0 [OPTIONS] [STORAGE_CLASS_1] [STORAGE_CLASS_2] ...

Runs an FIO benchmark against one or more dynamically provisioned StorageClasses.
If no StorageClasses are provided as arguments, it uses the defaults from the script:
(${STORAGE_CLASSES_TO_TEST[*]})

OPTIONS:
    -d, --dry-run   Show what would be executed without running tests
    -q, --quiet     Hide verbose debug output
    -h, --help      Show this help message

EXAMPLE:
    $0                              # Run with default StorageClasses
    $0 longhorn-fast local-ssd      # Run with specified StorageClasses
EOF
}

# --- ARGUMENT PARSING ---
# All non-option arguments are treated as StorageClasses
NEW_SC_LIST=()
while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--dry-run)
            DRY_RUN=true
            shift
            ;;
        -q|--quiet)
            VERBOSE=false
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        -*)
            log_error "Unknown option: $1"
            usage
            exit 1
            ;;
        *)
            NEW_SC_LIST+=("$1")
            shift
            ;;
    esac
done

if [[ ${#NEW_SC_LIST[@]} -gt 0 ]]; then
    STORAGE_CLASSES_TO_TEST=("${NEW_SC_LIST[@]}")
fi

# --- VALIDATION ---
check_prerequisites() {
    log_info "Checking prerequisites..."
    if ! command -v kubectl >/dev/null 2>&1; then
        log_error "kubectl is not installed or not in PATH"
        exit 1
    fi
    if ! kubectl cluster-info >/dev/null 2>&1; then
        log_error "Cannot connect to Kubernetes cluster"
        exit 1
    fi
    log_success "Prerequisites check passed"
}

check_storage_class_exists() {
    local sc_name="$1"
    log_info "Validating StorageClass '$sc_name'..."
    if ! kubectl get sc "$sc_name" >/dev/null 2>&1; then
        log_error "StorageClass '$sc_name' not found."
        return 1
    fi
    log_success "StorageClass '$sc_name' found."
    return 0
}


# --- FIO METRIC PARSING ---
parse_fio_metrics() {
    local log_file=$1
    local storage_name=$2
    log_debug "Parsing FIO results for $storage_name..."
    if [[ ! -f "$log_file" ]]; then
        log_error "Log file $log_file does not exist"
        echo "$storage_name,NO_LOG_FILE,NO_LOG_FILE,NO_LOG_FILE,NO_LOG_FILE,NO_LOG_FILE,NO_LOG_FILE" >> summary.csv
        return 1
    fi
    if ! grep -qE "(fio-.*: \(g=0\)|Jobs: [0-9]+ \(f=[0-9]+\)|All jobs: finished)" "$log_file" 2>/dev/null; then
        log_warn "FIO completion signature not found in logs for $storage_name. Parsing may fail."
    fi
    local read_iops=$(grep -E "READ:|read:" "$log_file" | sed -E 's/.*[Ii][Oo][Pp][Ss]=([0-9kK.]+).*/\1/' 2>/dev/null | head -1)
    local read_bw=$(grep -E "READ:|read:" "$log_file" | sed -E 's/.*[Bb][Ww]=([^,\s]+).*/\1/' 2>/dev/null | head -1)
    local write_iops=$(grep -E "WRITE:|write:" "$log_file" | sed -E 's/.*[Ii][Oo][Pp][Ss]=([0-9kK.]+).*/\1/' 2>/dev/null | head -1)
    local write_bw=$(grep -E "WRITE:|write:" "$log_file" | sed -E 's/.*[Bb][Ww]=([^,\s]+).*/\1/' 2>/dev/null | head -1)
    local read_lat=$(grep -A 10 -E "READ:|read:" "$log_file" | grep -E "(lat|clat).*avg" | sed -E 's/.*avg=([0-9.]+).*/\1/' 2>/dev/null | head -1)
    local write_lat=$(grep -A 10 -E "WRITE:|write:" "$log_file" | grep -E "(lat|clat).*avg" | sed -E 's/.*avg=([0-9.]+).*/\1/' 2>/dev/null | head -1)
    
    [[ -z "$read_iops" ]] && read_iops="N/A"
    [[ -z "$read_bw" ]] && read_bw="N/A"
    [[ -z "$write_iops" ]] && write_iops="N/A"
    [[ -z "$write_bw" ]] && write_bw="N/A"
    [[ -z "$read_lat" ]] && read_lat="N/A"
    [[ -z "$write_lat" ]] && write_lat="N/A"

    if [[ "$read_iops" == "N/A" && "$write_iops" == "N/A" ]]; then
        log_error "Could not extract any meaningful metrics from FIO output for $storage_name."
        echo "$storage_name,PARSE_FAILED,PARSE_FAILED,PARSE_FAILED,PARSE_FAILED,PARSE_FAILED,PARSE_FAILED" >> summary.csv
        return 1
    fi
    log_success "Metrics parsed for $storage_name"
    echo "$storage_name,$read_iops,$read_bw,$write_iops,$write_bw,$read_lat,$write_lat" >> summary.csv
    return 0
}

# --- CORE BENCHMARK LOGIC ---
run_bench_pod() {
    local name=$1
    local pvc_name=$2
    log_info "Preparing benchmark pod for $name on PVC $pvc_name..."
    local pod_spec
    pod_spec=$(cat << EOF
{
  "apiVersion": "v1",
  "spec": {
    "restartPolicy": "Never",
    "nodeSelector": {
      "storage/local-storage": "true"
    },
    "containers": [{
      "name": "fio", "image": "alpine:3.19",
      "command": ["sh", "-c", "apk add --no-cache fio >/dev/null 2>&1 && $FIO_CMD"],
      "volumeMounts": [{ "name": "testvol", "mountPath": "/mnt" }]
    }],
    "volumes": [{ "name": "testvol", "persistentVolumeClaim": { "claimName": "$pvc_name" } }]
  }
}
EOF
)
    if [[ "$DRY_RUN" == "true" ]]; then
        log_info "DRY RUN - Would create pod with spec:"
        echo "$pod_spec" | jq '.' 2>/dev/null || echo "$pod_spec"
        return 0
    fi

    local pod_name="fio-bench-$name"
    kubectl delete pod "$pod_name" --ignore-not-found=true >/dev/null 2>&1
    log_info "Creating benchmark pod: $pod_name"
    if ! kubectl run "$pod_name" --image=alpine:3.19 --overrides="$pod_spec"; then
        log_error "Failed to create benchmark pod for $name"
        return 1
    fi
    RUNNING_PODS+=("$pod_name")

    log_info "Monitoring benchmark progress (timeout: 5 minutes)..."
    local wait_count=0
    local max_wait=60 # 5 minutes
    while [[ $wait_count -lt $max_wait ]]; do
        local pod_status
        pod_status=$(kubectl get pod "$pod_name" -o jsonpath='{.status.phase}' 2>/dev/null || echo "Unknown")
        case "$pod_status" in
            "Succeeded") log_success "Benchmark completed successfully"; break ;;
            "Failed") log_error "Benchmark pod failed"; kubectl logs "$pod_name" > "result-$name.log"; return 1 ;;
            "Running") if (( wait_count % 12 == 0 )); then log_info "Benchmark still running... ($((wait_count * 5))s elapsed)"; fi ;;
            "Pending") if (( wait_count > 6 )); then log_warn "Pod still pending..."; fi ;;
            "Unknown") log_error "Pod disappeared or kubectl error"; return 1 ;;
        esac
        sleep 5
        ((wait_count++))
    done

    if [[ $wait_count -ge $max_wait ]]; then
        log_error "Benchmark timed out after 5 minutes"
        kubectl logs "$pod_name" > "result-$name.log"
        return 1
    fi

    log_info "Collecting benchmark results..."
    if ! kubectl logs "$pod_name" > "result-$name.log"; then
        log_error "Failed to collect benchmark logs for $name"
        return 1
    fi
    
    # Clean up and untrack pod
    kubectl delete pod "$pod_name" --ignore-not-found=true >/dev/null 2>&1
    local temp_pods=(); for p in "${RUNNING_PODS[@]}"; do if [[ "$p" != "$pod_name" ]]; then temp_pods+=("$p"); fi; done
    RUNNING_PODS=("${temp_pods[@]}")

    return 0
}

# --- MAIN TEST CYCLE WRAPPER ---
run_full_test_cycle() {
    local sc_name="$1"
    local pvc_name="fio-benchmark-$(echo "$sc_name" | tr '_' '-')" # Sanitize name
    
    log_info "------------------------------------------------------------"
    log_info "Starting full test cycle for StorageClass: $sc_name"
    log_info "------------------------------------------------------------"

    if [[ "$DRY_RUN" == "true" ]]; then
        log_info "DRY RUN - Would create PVC '$pvc_name' with StorageClass '$sc_name'"
        run_bench_pod "$sc_name" "$pvc_name"
        log_info "DRY RUN - Would delete PVC '$pvc_name'"
        return 0
    fi
    
    if ! check_storage_class_exists "$sc_name"; then
        return 1
    fi

    log_info "Creating PVC '$pvc_name'..."
    kubectl delete pvc "$pvc_name" --ignore-not-found=true >/dev/null 2>&1
    if ! kubectl apply -f - <<EOF
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: $pvc_name
spec:
  accessModes: ["ReadWriteOnce"]
  resources: {requests: {storage: 2Gi}}
  storageClassName: $sc_name
EOF
    then
        log_error "Failed to create PVC '$pvc_name'. Skipping test."
        return 1
    fi
    CREATED_PVCS+=("$pvc_name")

    # --- NEW SMARTER LOGIC ---
    # Check the volumeBindingMode of the StorageClass to decide if we should wait.
    local binding_mode
    binding_mode=$(kubectl get sc "$sc_name" -o jsonpath='{.volumeBindingMode}')
    
    # If mode is Immediate (or empty, which defaults to Immediate), wait for the PVC to bind.
    if [[ "$binding_mode" == "Immediate" || -z "$binding_mode" ]]; then
        log_info "Waiting for PVC '$pvc_name' to be bound (BindingMode: Immediate)..."
        # Use a more reliable wait command
        if ! kubectl wait --for=jsonpath='{.status.phase}=Bound' --timeout=120s pvc/"$pvc_name"; then
            log_error "PVC '$pvc_name' failed to become Bound. Check provisioner logs."
            kubectl describe pvc "$pvc_name"
            # Cleanup the failed PVC before returning
            kubectl delete pvc "$pvc_name" --ignore-not-found=true >/dev/null 2>&1
            return 1
        fi
        log_success "PVC '$pvc_name' is Bound."
    else
        log_info "Skipping PVC wait (BindingMode: WaitForFirstConsumer). Pod creation will trigger the bind."
    fi
    # --- END NEW LOGIC ---

    # Run the benchmark pod
    local bench_success=true
    if ! run_bench_pod "$sc_name" "$pvc_name"; then
        log_error "Benchmark pod failed for $sc_name"
        bench_success=false
    fi

    # Clean up PVC and untrack
    log_info "Deleting PVC '$pvc_name'..."
    kubectl delete pvc "$pvc_name" --ignore-not-found=true >/dev/null 2>&1
    local temp_pvcs=(); for p in "${CREATED_PVCS[@]}"; do if [[ "$p" != "$pvc_name" ]]; then temp_pvcs+=("$p"); fi; done
    CREATED_PVCS=("${temp_pvcs[@]}")

    # Parse results if benchmark was successful
    if [[ "$bench_success" == "true" ]]; then
        if ! parse_fio_metrics "result-$sc_name.log" "$sc_name"; then
            log_error "Failed to parse metrics for $sc_name"
            return 1
        fi
    else
        echo "$sc_name,BENCH_FAILED,BENCH_FAILED,BENCH_FAILED,BENCH_FAILED,BENCH_FAILED,BENCH_FAILED" >> summary.csv
        return 1
    fi
    
    log_success "Test cycle completed for $sc_name."
    return 0
}


# --- MAIN EXECUTION ---
main() {
    log_info "Starting Kubernetes Storage Benchmark"
    log_info "Testing StorageClasses: ${STORAGE_CLASSES_TO_TEST[*]}"
    
    if [[ "$DRY_RUN" == "true" ]]; then
        check_prerequisites
        for sc in "${STORAGE_CLASSES_TO_TEST[@]}"; do
            run_full_test_cycle "$sc"
        done
        log_info "Dry run completed."
        exit 0
    fi
    
    check_prerequisites
    
    # Initialize summary file
    echo "StorageClass,Read_IOPS,Read_BW,Write_IOPS,Write_BW,Read_Latency_us,Write_Latency_us" > summary.csv
    
    local all_tests_ok=true
    for sc in "${STORAGE_CLASSES_TO_TEST[@]}"; do
        if ! run_full_test_cycle "$sc"; then
            all_tests_ok=false
            log_warn "Benchmark for '$sc' encountered an issue."
        fi
    done
    
    # Display results
    echo
    log_info "==================== Benchmark Summary ===================="
    if [[ -f summary.csv ]] && [[ $(wc -l < summary.csv) -gt 1 ]]; then
        if command -v column >/dev/null 2>&1; then
            column -t -s, summary.csv
        else
            cat summary.csv
        fi
    else
        log_error "No successful benchmarks were completed to summarize."
    fi
    echo "========================================================="
    
    if [[ "$all_tests_ok" == "true" ]]; then
        log_success "All benchmarks completed successfully."
        exit 0
    else
        log_error "One or more benchmarks failed."
        exit 1
    fi
}

main "$@"