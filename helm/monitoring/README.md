# monitoring

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for cluster monitoring

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| appName | string | `"observability-metrics"` |  |
| config.remoteWriteUrl | string | `nil` |  |
| config.scrapeInterval | string | `"10s"` |  |
| ksm.image.repo | string | `"registry.k8s.io/kube-state-metrics/kube-state-metrics"` |  |
| ksm.image.tag | string | `"v2.16.0"` |  |
| ksm.replicaCount | int | `1` |  |
| ksm.resources.limits.memory | string | `"512Mi"` |  |
| ksm.resources.requests.cpu | string | `"100m"` |  |
| ksm.resources.requests.memory | string | `"256Mi"` |  |
| vmagent.image.repo | string | `"victoriametrics/vmagent"` |  |
| vmagent.image.tag | string | `"v1.96.0"` |  |
| vmagent.replicaCount | int | `1` |  |
| vmagent.resources.limits.memory | string | `"512Mi"` |  |
| vmagent.resources.requests.cpu | string | `"100m"` |  |
| vmagent.resources.requests.memory | string | `"128Mi"` |  |
