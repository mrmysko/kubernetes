# miniflux

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2](https://img.shields.io/badge/AppVersion-2-informational?style=flat-square)

Basic helm template for Miniflux RSS-reader

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1001` |  |
| app.image.repository | string | `"miniflux/miniflux"` |  |
| app.image.tag | string | `"2.2.13"` |  |
| app.replicaCount | int | `1` |  |
| app.uid | int | `1001` |  |
| appName | string | `"miniflux"` |  |
| database.host | string | `nil` |  |
| database.name | string | `nil` |  |
| database.namespace | string | `nil` |  |
| database.password | string | `nil` |  |
| database.username | string | `nil` |  |
| env.baseUrl | string | `nil` | FQDN for application, with scheme |
| env.oidc.clientID | string | `nil` | Miniflux client ID |
| env.oidc.clientSecret | string | `nil` | Miniflux client secret |
| env.oidc.endpoint | string | `nil` | URL to OIDC endpoint, without discovery |
| env.oidc.name | string | `nil` | Name of OIDC application |
| env.oidc.redirectURL | string | `nil` | Miniflux redirect URL |
| ingress.baseUrl | string | `nil` | FQDN for application, without scheme |
| service.port | int | `8080` | Miniflux port |
