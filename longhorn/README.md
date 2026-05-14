## Installation

```kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.11.1/deploy/longhorn.yaml```

## Metrics

kubectl annotate svc longhorn-backend -n longhorn-system \
  prometheus.io/scrape="true" \
  prometheus.io/port="9500" \
  prometheus.io/path="/metrics"