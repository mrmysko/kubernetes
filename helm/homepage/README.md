# Homepage

Deploys [Homepage](https://github.com/gethomepage/homepage) for use as an iframe with [glance](https://github.com/mrmysko/kubernetes/tree/main/self-helm/glance).

Other deployments are annotated for autodiscovery by this deployment.

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values
|Parameter                  |Description                |Default  |Required|
|---                        |---                        |:---:    |:---:|
|service.port               |Service port               |3000
|ingress.baseUrl            |Traefik ingress URL        |

## Install

```helm upgrade -i --create-namespace -n homepage homepage -f values.yaml ./```