# Huntarr

This is just a service and proxy for an external Huntarr server

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values



## Install

helm upgrade -i --create-namespace -n huntarr huntarr -f values.yaml ./