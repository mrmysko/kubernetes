# Sonarr

This is just a service and proxy for an external Sonarr server

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values

## Install

helm upgrade -i --create-namespace -n bazarr bazarr -f values.yaml ./