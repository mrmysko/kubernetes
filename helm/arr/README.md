# Arr

This is just some forward auth for services and proxies to external servers

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values



## Install

helm upgrade -i --create-namespace -n arr arr -f values.yaml ./