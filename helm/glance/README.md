# Glance

Deploys [Glance](https://github.com/glanceapp/glance), a homepage dashboard.

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values
|Parameter                  |Description                |Default  |Required|
|---                        |---                        |:---:    |:---:|
|service.port               |Service port               |8080
|ingress.baseUrl            |Traefik ingress URL        |


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

```helm upgrade -i --create-namespace -n glance glance -f values.yaml ./```