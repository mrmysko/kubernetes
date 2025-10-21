# Bookstack

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 25.2](https://img.shields.io/badge/AppVersion-25.2-informational?style=flat-square)

A Helm chart for BookStack. The database is handled by a clustered MariaDB deployment.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.healthCheck.enabled | bool | `true` |  |
| app.healthCheck.initialDelay | int | `10` |  |
| app.healthCheck.path | string | `"/status"` |  |
| app.healthCheck.periodSeconds | int | `10` |  |
| app.healthCheck.scheme | string | `"HTTP"` |  |
| app.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| app.image.repository | string | `"solidnerd/bookstack"` | App image |
| app.image.tag | float | `25.2` | Image version |
| app.name | string | `"bookstack"` | App name |
| app.replicaCount | int | `1` | Number of pods |
| app.resources.limits.memory | string | `"256Mi"` |  |
| app.resources.requests.cpu | string | `"250m"` |  |
| app.resources.requests.memory | string | `"128Mi"` |  |
| config.appKey | string | `nil` |  |
| config.oidc.clientId | string | `nil` | App client ID |
| config.oidc.clientSecret | string | `nil` | App client secret |
| config.oidc.displayNameClaims | string | `nil` |  |
| config.oidc.endSessionEndpoint | string | `nil` | Logout URL |
| config.oidc.name | string | `nil` | OIDC name |
| config.oidc.url | string | `nil` | OIDC endpoint URL |
| database.enabled | bool | `true` |  |
| database.host | string | `nil` | FQDN to database |
| database.instanceName | string | `nil` | Database deployment name |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` | Database namespace |
| database.password | string | `nil` | Database password |
| database.port | int | `3306` | Database port |
| database.username | string | `nil` | Database user |
| ingress.baseUrl | string | `nil` | FQDN to application |
| ingress.enabled | bool | `true` |  |
| service.port | int | `8080` | App port |
| storage.size | string | `nil` |  |
