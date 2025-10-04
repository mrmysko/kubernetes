# RomM

Deploys [Vikunja](https://github.com/go-vikunja/vikunja).

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

## Install

```helm upgrade -i --create-namespace -n vikunja vikunja -f values.yaml ./```