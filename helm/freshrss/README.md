# FreshRSS

Deploys [FreshRSS](https://github.com/FreshRSS/FreshRSS), an RSS aggregator.

## Prerequisites

- [MariaDB operator](https://github.com/mariadb-operator/mariadb-operator)
- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values
|Parameter                  |Description                |Default  |Required|
|---                        |---                        |:---:    |:---:|
|service.port               |Service port               |8080
|ingress.baseUrl            |Traefik ingress URL        |
|config.trustedProxy        |
|config.oidc.providerMetadataUrl|

## Install

```helm upgrade -i --create-namespace -n freshrss freshrss -f values.yaml ./```