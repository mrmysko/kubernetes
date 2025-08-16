# Omni-tools

Deploys [omni-tools](https://github.com/iib0011/omni-tools).

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

## Install

helm upgrade -i --create-namespace -n omnitools omnitools -f values.yaml ./