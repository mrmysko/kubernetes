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
| app.image.pullPolicy | string | `"IfNotPresent"` |  |
| app.image.repository | string | `"solidnerd/bookstack"` |  |
| app.image.tag | float | `25.2` |  |
| app.replicaCount | int | `1` |  |
| app.resources.limits.memory | string | `"256Mi"` |  |
| app.resources.requests.cpu | string | `"250m"` |  |
| app.resources.requests.memory | string | `"128Mi"` |  |
| appName | string | `"bookstack"` |  |
| config.appKey | string | `nil` |  |
| config.oidc.clientId | string | `nil` |  |
| config.oidc.clientSecret | string | `nil` |  |
| config.oidc.displayNameClaims | string | `nil` |  |
| config.oidc.endSessionEndpoint | string | `nil` |  |
| config.oidc.issuer | string | `nil` |  |
| config.oidc.name | string | `nil` | OIDC name |
| database.enabled | bool | `true` |  |
| database.host | string | `nil` |  |
| database.instanceName | string | `nil` |  |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` |  |
| database.password | string | `nil` | Database password |
| database.port | int | `3306` | Database port |
| database.username | string | `nil` | Database user |
| ingress.baseUrl | string | `nil` |  |
| ingress.enabled | bool | `true` |  |
| service.port | int | `8080` |  |
| storage.size | string | `nil` |  |
