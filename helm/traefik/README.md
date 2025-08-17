# Traefik

Deploys some traefik things...

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values

## Install

helm upgrade -i --create-namespace -n traefik traefik -f values.yaml ./