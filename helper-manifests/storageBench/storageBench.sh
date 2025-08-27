#!/bin/bash
# Enhanced Benchmark script for Longhorn vs Local storage
set -euo pipefail

# Configuration
PVC_LONGHORN=mariadb-longhorn-pvc
DRY_RUN=false
VERBOSE=true

# Track running pods for cleanup
RUNNING_PODS=()

# Signal handling for cleanup
cleanup_on_exit() {
    if [[ ${#RUNNING_PODS[@]} -gt 0 ]]; then
        log_warn "Cleaning up benchmark pods due to script interruption..."
        for pod in "${RUNNING_PODS[@]}"; do
            if [[ -n "$pod" ]]; then
                log_debug "Deleting pod: $pod"
                kubectl delete pod "$pod" --ignore-not-found=true >/dev/null 2>&1
            fi
        done
    fi
}

# Set up signal traps
trap cleanup_on_exit EXIT
trap 'log_warn "Interrupted by user"; exit 130' INT TERM

# FIO Command to run
FIO_CMD="fio --name=randrw --ioengine=libaio --rw=randrw \
          --bs=4k --size=1G --numjobs=4 --runtime=60 --group_reporting \
          --filename=/mnt/testfile"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_debug() {
    if [[ "$VERBOSE" == "true" ]]; then
        echo -e "${BLUE}[DEBUG]${NC} $1"
    fi
}

usage() {
    cat << EOF
Usage: $0 [OPTIONS]

OPTIONS:
    -p, --pvc PVC_NAME          Longhorn PVC name (default: $PVC_LONGHORN)
    -d, --dry-run              Show what would be executed without running tests
    -q, --quiet                Hide verbose debug output
    -h, --help                 Show this help message

EXAMPLES:
    $0                         # Run with defaults (emptyDir for local storage)
    $0 --dry-run              # Show what would be executed
    $0 -p my-pvc              # Use custom PVC
    $0 --quiet                # Run with minimal output
EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--pvc)
            PVC_LONGHORN="$2"
            shift 2
            ;;
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
        *)
            log_error "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

# Validation functions
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
    
    if ! kubectl get namespace default >/dev/null 2>&1; then
        log_error "Cannot access default namespace"
        exit 1
    fi
    
    log_success "Prerequisites check passed"
}

validate_longhorn_pvc() {
    log_info "Validating Longhorn PVC '$PVC_LONGHORN'..."
    
    if ! kubectl get pvc "$PVC_LONGHORN" >/dev/null 2>&1; then
        log_error "PVC '$PVC_LONGHORN' not found"
        return 1
    fi
    
    local pvc_status
    pvc_status=$(kubectl get pvc "$PVC_LONGHORN" -o jsonpath='{.status.phase}')
    if [[ "$pvc_status" != "Bound" ]]; then
        log_error "PVC '$PVC_LONGHORN' is not bound (status: $pvc_status)"
        return 1
    fi
    
    log_success "Longhorn PVC validation passed"
    return 0
}

get_worker_node() {
    # Try to get worker nodes (nodes without control-plane taint)
    local worker_node
    worker_node=$(kubectl get nodes -o jsonpath='{range .items[*]}{.metadata.name}{" "}{.spec.taints[*].key}{"\n"}{end}' 2>/dev/null | \
        grep -v "node-role.kubernetes.io/control-plane\|node-role.kubernetes.io/master" | \
        head -1 | awk '{print $1}')
    
    # If no dedicated worker found, try nodes without NoSchedule taints
    if [[ -z "$worker_node" ]]; then
        worker_node=$(kubectl get nodes -o jsonpath='{range .items[*]}{.metadata.name}{" "}{.spec.taints[?(@.effect=="NoSchedule")].key}{"\n"}{end}' 2>/dev/null | \
            grep -v "node-role.kubernetes.io/control-plane\|node-role.kubernetes.io/master" | \
            head -1 | awk '{print $1}')
    fi
    
    # Fallback: get any schedulable node that's not explicitly a control plane
    if [[ -z "$worker_node" ]]; then
        worker_node=$(kubectl get nodes -l '!node-role.kubernetes.io/control-plane,!node-role.kubernetes.io/master' -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)
    fi
    
    # Last resort: get first available node (but don't log here to avoid output mixing)
    if [[ -z "$worker_node" ]]; then
        worker_node=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)
    fi
    
    echo "$worker_node"
}

validate_local_storage() {
    log_info "Validating local storage (emptyDir) availability..."
    log_info "Finding suitable worker node..."
    
    local worker_node
    worker_node=$(get_worker_node)
    
    if [[ -z "$worker_node" ]]; then
        log_error "No suitable nodes found for local storage"
        return 1
    fi
    
    # Check if the selected node is Ready
    local node_ready
    node_ready=$(kubectl get node "$worker_node" -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}' 2>/dev/null)
    if [[ "$node_ready" != "True" ]]; then
        log_error "Selected node '$worker_node' is not ready (status: $node_ready)"
        return 1
    fi
    
    log_success "Local storage validation passed (selected worker node: $worker_node)"
    return 0
}

# Parse FIO metrics with improved error handling
parse_fio_metrics() {
    local log_file=$1
    local storage_name=$2
    
    log_debug "Parsing FIO results for $storage_name..."
    
    # Debug: Show last few lines of log file
    if [[ -f "$log_file" ]]; then
        log_debug "Log file exists, checking contents..."
        if [[ "$VERBOSE" == "true" ]]; then
            echo "=== DEBUG: Last 10 lines of $log_file ==="
            tail -10 "$log_file"
            echo "=== END DEBUG ==="
        fi
    else
        log_error "Log file $log_file does not exist"
        echo "$storage_name,NO_LOG_FILE,NO_LOG_FILE,NO_LOG_FILE,NO_LOG_FILE,NO_LOG_FILE,NO_LOG_FILE" >> summary.csv
        return 1
    fi
    
    # Check if FIO completed successfully - look for various success indicators
    if ! grep -qE "(fio-.*: \(g=0\)|Jobs: [0-9]+ \(f=[0-9]+\)|All jobs: finished)" "$log_file" 2>/dev/null; then
        log_debug "FIO completion signature not found, checking for errors..."
        if grep -qE "(error|Error|ERROR|failed|Failed|FAILED)" "$log_file" 2>/dev/null; then
            log_error "Errors found in FIO output"
            grep -iE "(error|failed)" "$log_file" | head -3
        else
            log_debug "No obvious errors found, attempting to parse anyway..."
        fi
    fi
    
    # Extract metrics with error handling
    local read_iops write_iops read_bw write_bw read_lat write_lat
    
    read_iops=$(grep -E "READ:|read:" "$log_file" | sed -E 's/.*[Ii][Oo][Pp][Ss]=([0-9]+).*/\1/' 2>/dev/null | head -1)
    read_bw=$(grep -E "READ:|read:" "$log_file" | sed -E 's/.*[Bb][Ww]=([^,\s]+).*/\1/' 2>/dev/null | head -1)
    write_iops=$(grep -E "WRITE:|write:" "$log_file" | sed -E 's/.*[Ii][Oo][Pp][Ss]=([0-9]+).*/\1/' 2>/dev/null | head -1)
    write_bw=$(grep -E "WRITE:|write:" "$log_file" | sed -E 's/.*[Bb][Ww]=([^,\s]+).*/\1/' 2>/dev/null | head -1)
    
    # Extract latency metrics with multiple patterns
    read_lat=$(grep -A 10 -E "READ:|read:" "$log_file" | grep -E "(lat|clat).*avg" | sed -E 's/.*avg=([0-9.]+).*/\1/' 2>/dev/null | head -1)
    write_lat=$(grep -A 10 -E "WRITE:|write:" "$log_file" | grep -E "(lat|clat).*avg" | sed -E 's/.*avg=([0-9.]+).*/\1/' 2>/dev/null | head -1)
    
    # Fallback: look for any numeric values that might be metrics
    [[ -z "$read_iops" ]] && read_iops="N/A"
    [[ -z "$read_bw" ]] && read_bw="N/A"
    [[ -z "$write_iops" ]] && write_iops="N/A"
    [[ -z "$write_bw" ]] && write_bw="N/A"
    [[ -z "$read_lat" ]] && read_lat="N/A"
    [[ -z "$write_lat" ]] && write_lat="N/A"
    
    log_debug "Extracted metrics: R_IOPS=$read_iops, R_BW=$read_bw, W_IOPS=$write_iops, W_BW=$write_bw"
    
    if [[ "$read_iops" == "N/A" && "$write_iops" == "N/A" ]]; then
        log_error "Could not extract any meaningful metrics from FIO output"
        echo "$storage_name,PARSE_FAILED,PARSE_FAILED,PARSE_FAILED,PARSE_FAILED,PARSE_FAILED,PARSE_FAILED" >> summary.csv
        return 1
    fi
    
    log_success "Metrics parsed for $storage_name"
    echo "$storage_name,$read_iops,$read_bw,$write_iops,$write_bw,$read_lat,$write_lat" >> summary.csv
    return 0
}

# Enhanced benchmark function
run_bench() {
    local NAME=$1
    local PVC=$2
    local STORAGE_TYPE=$3  # "pvc" or "local"
    
    log_info "Preparing benchmark for $NAME storage..."
    
    local volume_spec node_selector=""
    
    if [[ -n "$PVC" ]]; then
        volume_spec="\"volumes\": [{ \"name\": \"testvol\", \"persistentVolumeClaim\": { \"claimName\": \"$PVC\" } }]"
    elif [[ "$STORAGE_TYPE" == "local" ]]; then
        # Use emptyDir volume for local storage (works everywhere, no security issues)
        log_debug "Using emptyDir volume for local storage comparison"
        local node_name
        node_name=$(get_worker_node)
        if [[ -z "$node_name" ]]; then
            log_error "No suitable worker nodes available for local storage"
            return 1
        fi
        
        volume_spec="\"volumes\": [{ \"name\": \"testvol\", \"emptyDir\": {} }]"
        # No node selector needed - let Kubernetes schedule it
        log_debug "Local storage will use node filesystem via emptyDir"
    else
        log_error "Invalid storage configuration for $NAME"
        return 1
    fi
    
    local pod_spec
    pod_spec=$(cat << EOF
{
  "apiVersion": "v1",
  "spec": {
    "restartPolicy": "Never",
    "containers": [{
      "name": "fio",
      "image": "alpine:3.19",
      "command": ["sh", "-c", "apk add --no-cache fio >/dev/null 2>&1 && $FIO_CMD"],
      "volumeMounts": [{ "name": "testvol", "mountPath": "/mnt" }],
      "securityContext": {
        "runAsUser": 0,
        "allowPrivilegeEscalation": true,
        "seccompProfile": { "type": "RuntimeDefault" },
        "readOnlyRootFilesystem": false
      },
      "resources": {
        "requests": {
          "memory": "256Mi",
          "cpu": "100m"
        },
        "limits": {
          "memory": "512Mi",
          "cpu": "500m"
        }
      }
    }],
    $volume_spec
    $node_selector
  }
}
EOF
)
    
    if [[ "$DRY_RUN" == "true" ]]; then
        log_info "DRY RUN - Would execute benchmark for $NAME storage with pod spec:"
        echo "$pod_spec" | jq '.' 2>/dev/null || echo "$pod_spec"
        return 0
    fi
    
    log_info "Running benchmark for $NAME storage..."
    
    # Clean up any existing pod
    kubectl delete pod "fio-$NAME" --ignore-not-found=true >/dev/null 2>&1
    
    # Start the benchmark pod (non-interactive to avoid hanging)
    log_info "Creating benchmark pod: fio-$NAME"
    
    # Debug: Show the pod spec that will be used
    if [[ "$VERBOSE" == "true" && "$DRY_RUN" != "true" ]]; then
        log_debug "Pod specification preview:"
        echo "$pod_spec" | head -10
        echo "..."
    fi
    
    if ! kubectl run "fio-$NAME" \
        --image=alpine:3.19 \
        --overrides="$pod_spec" 2>&1; then
        log_error "Failed to create benchmark pod for $NAME storage"
        log_error "Checking for existing pods or conflicts..."
        kubectl get pods | grep "fio-$NAME" || log_info "No conflicting pods found"
        return 1
    fi
    
    # Track this pod for cleanup
    RUNNING_PODS+=("fio-$NAME")
    
    # Monitor the pod with timeout
    log_info "Monitoring benchmark progress (timeout: 5 minutes)..."
    local wait_count=0
    local max_wait=60  # 5 minutes (60 * 5 seconds)
    
    while [[ $wait_count -lt $max_wait ]]; do
        local pod_status
        pod_status=$(kubectl get pod "fio-$NAME" -o jsonpath='{.status.phase}' 2>/dev/null)
        
        case "$pod_status" in
            "Succeeded")
                log_success "Benchmark completed successfully"
                break
                ;;
            "Failed")
                log_error "Benchmark pod failed"
                kubectl logs "fio-$NAME" > "result-$NAME.log" 2>&1
                kubectl delete pod "fio-$NAME" --ignore-not-found=true >/dev/null 2>&1
                return 1
                ;;
            "Running")
                if [[ $((wait_count % 12)) -eq 0 ]]; then  # Every minute
                    log_info "Benchmark still running... ($((wait_count * 5))s elapsed)"
                fi
                ;;
            "Pending")
                if [[ $wait_count -gt 6 ]]; then  # After 30 seconds
                    log_warn "Pod still pending after 30s, checking for issues..."
                    kubectl describe pod "fio-$NAME" | grep -A 5 "Events:" || true
                fi
                ;;
            "")
                log_error "Pod not found or kubectl error"
                return 1
                ;;
        esac
        
        sleep 5
        ((wait_count++))
    done
    
    # Check if we timed out
    if [[ $wait_count -ge $max_wait ]]; then
        log_error "Benchmark timed out after 5 minutes"
        kubectl logs "fio-$NAME" > "result-$NAME.log" 2>&1 || echo "Failed to get logs" > "result-$NAME.log"
        kubectl delete pod "fio-$NAME" --ignore-not-found=true >/dev/null 2>&1
        return 1
    fi
    
    # Get the results
    log_info "Collecting benchmark results..."
    if ! kubectl logs "fio-$NAME" > "result-$NAME.log" 2>&1; then
        log_error "Failed to collect benchmark logs for $NAME storage"
        kubectl delete pod "fio-$NAME" --ignore-not-found=true >/dev/null 2>&1
        return 1
    fi
    
    # Clean up the pod and remove from tracking
    kubectl delete pod "fio-$NAME" --ignore-not-found=true >/dev/null 2>&1
    # Remove from tracking array (filter out empty entries)
    local temp_array=()
    for pod in "${RUNNING_PODS[@]}"; do
        if [[ "$pod" != "fio-$NAME" && -n "$pod" ]]; then
            temp_array+=("$pod")
        fi
    done
    RUNNING_PODS=("${temp_array[@]}")
    
    # Parse results
    if ! parse_fio_metrics "result-$NAME.log" "$NAME"; then
        log_error "Failed to parse metrics for $NAME storage"
        return 1
    fi
    
    log_success "Benchmark completed for $NAME storage"
    return 0
}

# Show dry run information
show_dry_run_info() {
    cat << EOF

===== DRY RUN MODE =====
Configuration:
  Longhorn PVC: $PVC_LONGHORN
  FIO Command: $FIO_CMD

Tests that would be executed:
  1. Longhorn storage benchmark using PVC: $PVC_LONGHORN
  2. Local storage benchmark using emptyDir

No actual benchmarks will be executed in dry-run mode.
EOF
}

# Main execution
main() {
    log_info "Starting Kubernetes Storage Benchmark"
    log_info "Configuration - PVC: $PVC_LONGHORN, Local Storage: emptyDir"
    
    if [[ "$DRY_RUN" == "true" ]]; then
        show_dry_run_info
        check_prerequisites
        validate_longhorn_pvc || log_warn "Longhorn PVC validation would fail"
        validate_local_storage || log_warn "Local storage validation would fail"
        run_bench "longhorn" "$PVC_LONGHORN" ""
        run_bench "local" "" "local"
        log_info "Dry run completed"
        return 0
    fi
    
    # Real execution
    check_prerequisites
    
    # Initialize summary file
    echo "Storage,Read_IOPS,Read_BW,Write_IOPS,Write_BW,Read_Latency_us,Write_Latency_us" > summary.csv
    
    local longhorn_success=true
    local local_success=true
    
    # Test Longhorn storage
    if validate_longhorn_pvc; then
        if ! run_bench "longhorn" "$PVC_LONGHORN" ""; then
            longhorn_success=false
            log_error "Longhorn benchmark failed"
        fi
    else
        longhorn_success=false
        log_error "Skipping Longhorn benchmark due to validation failure"
    fi
    
    # Test local storage
    if validate_local_storage; then
        if ! run_bench "local" "" "local"; then
            local_success=false
            log_error "Local storage benchmark failed"
        fi
    else
        local_success=false
        log_error "Skipping local storage benchmark due to validation failure"
    fi
    
    # Display results
    echo
    echo "===== Benchmark Summary ====="
    if [[ -f summary.csv ]] && [[ $(wc -l < summary.csv) -gt 1 ]]; then
        if command -v column >/dev/null 2>&1; then
            column -t -s, summary.csv
        else
            # Manual formatting when column command is not available
            echo "Storage    Read_IOPS  Read_BW     Write_IOPS  Write_BW    Read_Latency_us  Write_Latency_us"
            echo "--------   ---------  ----------  ----------  ----------  ---------------  ----------------"
            tail -n +2 summary.csv | while IFS=, read -r storage r_iops r_bw w_iops w_bw r_lat w_lat; do
                printf "%-9s  %-9s  %-10s  %-10s  %-10s  %-15s  %-16s\n" "$storage" "$r_iops" "$r_bw" "$w_iops" "$w_bw" "$r_lat" "$w_lat"
            done
        fi
    else
        log_error "No successful benchmarks completed"
    fi
    
    # Final status
    echo
    if [[ "$longhorn_success" == "true" && "$local_success" == "true" ]]; then
        log_success "All benchmarks completed successfully"
        exit 0
    elif [[ "$longhorn_success" == "true" || "$local_success" == "true" ]]; then
        log_warn "Some benchmarks completed successfully"
        exit 0
    else
        log_error "All benchmarks failed"
        exit 1
    fi
}

# Run main function
main "$@"