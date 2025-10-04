# RomM

Deploys [RomM - Rom Manager](https://github.com/rommapp/romm).

## Prerequisites

- [csi-driver-smb](https://github.com/kubernetes-csi/csi-driver-smb)
- [MariaDB operator](https://github.com/mariadb-operator/mariadb-operator)
- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values
|Parameter                  |Description                |Default  |Required|
|---                        |---                        |:---:    |:---:|
|service.port               |Service port               |
|ingress.baseUrl            |Traefik ingress URL        |
|config.dbDriver            |                           |mariadb   |
|oidc.redirectUri           |
|oidc.serverApplicationUrl  |
|oidc.tlsCaCertFile         |                           |/tmp/fullchain.pem|

## Install

```helm upgrade -i --create-namespace -n romm romm -f values.yaml ./```