# Install

Install NFD

    helm install -n node-feature-discovery --create-namespace nfd oci://registry.k8s.io/nfd/charts/node-feature-discovery --version 0.19.0

Make namespace privileged

    kubectl label namespace node-feature-discovery pod-security.kubernetes.io/enforce=privileged pod-security.kubernetes.io/audit=privileged pod-security.kubernetes.io/warn=privileged --overwrite

Create NodeFeatureRules for detecting GPUs on nodes

    kubectl apply -k 'https://github.com/intel/intel-device-plugins-for-kubernetes/deployments/nfd/overlays/node-feature-rules?ref=v0.35.0'

Create intel-gpu-plugin namespace

    kubectl create namespace intel-gpu-plugin

Make namespace privileged

    kubectl label namespace intel-gpu-plugin \
    pod-security.kubernetes.io/enforce=privileged \
    pod-security.kubernetes.io/audit=privileged \
    pod-security.kubernetes.io/warn=privileged

Create GPU plugin daemonset

    kubectl apply -k 'https://github.com/intel/intel-device-plugins-for-kubernetes/deployments/gpu_plugin/overlays/nfd_labeled_nodes?ref=v0.35.0' -n intel-gpu-plugin