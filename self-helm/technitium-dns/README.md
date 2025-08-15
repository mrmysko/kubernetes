# Technitium

Deploys a technitium standalone server.

Multiple replicas will handle requests independently, no shared states.

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Creating the secret
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

helm upgrade -i -n technitium technitium -f values.yaml ./