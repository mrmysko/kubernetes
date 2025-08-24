# Navidrome

Deploys [Navidrome](https://github.com/navidrome/navidrome) music server.

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
|storage.smb.url            |
|storage.smb.uid            |
|storage.smb.gid            |
|storage.existingPvcName    |
|config.reverseProxyWhitelist|
|config.smbUser             |
|config.smbPassword         |

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

```helm upgrade -i --create-namespace -n navidrome navidrome -f values.yaml ./```