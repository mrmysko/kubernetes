# Kubernetes home cluster

A monorepo containing manifest files for my kubernetes cluster.

<img src="img/kube-logo.png" width="200" />

## Notes about upgrading

Note to self: Before upgrading Kubernetes or components, make sure the following are compatible with new versions

- Metallb
- Cilium
- Longhorn
- Cert-manager
- SMB CSI
- CNPG
- VictoriaMetrics Operator
- Grafana Operator
- MariaDB Operator
- kube-state-metrics
- metrics-server