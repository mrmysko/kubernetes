# Technitium

Deploys a [Technitium](https://github.com/TechnitiumSoftware/DnsServer) DNS server.

Multiple replicas will handle requests independently, no shared states.

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values
|Parameter                  |Description                |Default  |Required|
|---                        |---                        |:---:    |:---:|
|service.port               |Service port               |
|ingress.baseUrl            |Traefik ingress URL        |
|config.dnsServerDomain     |                           |         |
|config.dnsServerAdminPassword|WebUI password           |         |No


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

helm upgrade -i --create-namespace -n technitium technitium -f values.yaml ./