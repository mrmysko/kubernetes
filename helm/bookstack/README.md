# BookStack

Deploys [BookStack](https://github.com/BookStackApp/BookStack).

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
|config.oidc.name           |
|config.oidc.endSessionEndpoint|
|config.oidc.issuer         |
|config.oidc.displayNameClaims|

## Install

```helm upgrade -i --create-namespace -n bookstack bookstack -f values.yaml ./```