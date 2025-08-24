# Reverse Proxy

A deployment for proxying external services with middlewares between.

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values

## Install

```helm upgrade -i --create-namespace -n reverse reverse -f values.yaml ./```