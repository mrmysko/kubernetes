# Immich

Deploys [Immich](https://github.com/immich-app/immich) photo manager.

## Prerequisites

- [csi-driver-smb](https://github.com/kubernetes-csi/csi-driver-smb)
- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values
|Parameter                  |Description                |Default  |Required|
|---                        |---                        |:---:    |:---:|
|service.port               |Service port               |
|ingress.baseUrl            |Traefik ingress URL        |
|config.machineLearning.url |
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

```helm upgrade -i --create-namespace -n immich immich -f values.yaml ./```