## Installation

```kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.12.1/deploy/longhorn.yaml```

If using another storageClass as default:

  kubectl edit configmap longhorn-storageclass -n longhorn-system

  Remove annotation

## Enable metrics

kubectl annotate svc longhorn-backend -n longhorn-system \
  prometheus.io/scrape="true" \
  prometheus.io/port="9500" \
  prometheus.io/path="/metrics"

## Enable structured (json) logging

kubectl -n longhorn-system edit daemonset longhorn-manager

Add:
    command:
    ...
    - -j
    ...