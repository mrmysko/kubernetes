## Installation

```kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.12.0/deploy/longhorn.yaml```

## Metrics

kubectl annotate svc longhorn-backend -n longhorn-system \
  prometheus.io/scrape="true" \
  prometheus.io/port="9500" \
  prometheus.io/path="/metrics"

## JSON logging

kubectl -n longhorn-system edit daemonset longhorn-manager

Add:
    command:
    ...
    - -j
    ...