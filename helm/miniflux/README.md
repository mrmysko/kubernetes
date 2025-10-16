# Miniflux

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2](https://img.shields.io/badge/AppVersion-2-informational?style=flat-square)

A helm chart for Miniflux RSS-reader. Connecting to a clustered CNPG postgres database.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1001` | Runtime group |
| app.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| app.image.repository | string | `"miniflux/miniflux"` | App image |
| app.image.tag | string | `"2.2.13"` | App version |
| app.name | string | `"miniflux"` | App name |
| app.replicaCount | int | `1` | Number of pods |
| app.uid | int | `1001` | Runtime user |
| database.host | string | `nil` | Database url |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` | Database namespace |
| database.password | string | `nil` | Database password |
| database.username | string | `nil` | Database user |
| env.baseUrl | string | `nil` | FQDN for application, with scheme |
| env.oidc.clientID | string | `nil` | App client ID |
| env.oidc.clientSecret | string | `nil` | App client secret |
| env.oidc.endpoint | string | `nil` | URL to OIDC endpoint, without discovery |
| env.oidc.name | string | `nil` | Name of OIDC application |
| env.oidc.redirectURL | string | `nil` | App redirect URL |
| service.port | int | `8080` | App port |
