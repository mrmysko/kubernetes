
## Upgrading

### Kubernetes

    https://docs.siderolabs.com/kubernetes-guides/advanced-guides/upgrading-kubernetes

### Talos

    talosctl --nodes <controlplane node> upgrade-k8s --to <k8s_release>

## Commands

    kubectl -n namespace <namespace> get secret <secret> -o jsonpath='{.data.<key>}' | base64 -d

    kubectl run <pod_name> --image <image> --restart Never --rm -it -- /bin/bash

    kubectl debug -it -n <namespace> <pod> --image <image> --target <container>

## Images

### Network troubleshooting
- nicolaka/netshoot

### Database
- mariadb:11.8.2
- postgres:17-alpine