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

## Install

```helm upgrade -i --create-namespace -n glance glance -f values.yaml ./```