# Grafana

Deploys [Grafana](https://github.com/gethomepage/homepage), configures datasources and dashboards for kubernetes cluster and oidc login.

## Prerequisites

- [Grafana operator](https://github.com/grafana/grafana-operator)
- [MariaDB operator](https://github.com/mariadb-operator/mariadb-operator)
- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values
|Parameter                  |Description                |Default  |Required|
|---                        |---                        |:---:    |:---:|
|service.port               |Service port               |3000
|ingress.baseUrl            |Traefik ingress URL        |
|config.oidc.issuerUrl      |URL to OIDC server         | 
|config.oidc.clientSecret   |
|config.datasource.tlsSkipVerify|                       |true
|config.datasource.vm.name  |
|config.datasource.vm.version|
|config.datasource.vm.url   |
|config.datasource.vl.name  |
|config.datasource.vl.version|
|config.datasource.vl.url   |


### Creating the secret
Place in the templates directory.

```
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Release.Name }}-secret
  labels:
    {{- include "common.labels" . | nindent 4 }}
type: Opaque
stringData:
```

## Install

```helm upgrade -i --create-namespace -n grafana grafana -f values.yaml ./```