# Librechat

Deploys [Navidrome](https://github.com/navidrome/navidrome) music server.

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

## Install

```helm upgrade -i --create-namespace -n librechat librechat -f values.yaml ./```