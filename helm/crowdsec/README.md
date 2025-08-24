# Grafana

Deploys [Crowdsec](https://github.com/crowdsecurity/crowdsec)

## Prerequisites

- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values

## Install

```helm upgrade -i --create-namespace -n crowdsec crowdsec -f values.yaml ./```