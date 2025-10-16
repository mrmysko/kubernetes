# RomM

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4](https://img.shields.io/badge/AppVersion-4-informational?style=flat-square)

A helm template for RomM. The database is handled by a clustered MariaDB deployment.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `3100` | Runtime group |
| app.image.repository | string | `"rommapp/romm"` | App image |
| app.image.tag | string | `"4.3.1"` | Image version |
| app.name | string | `"romm"` | App name |
| app.replicaCount | int | `1` | Number of pods |
| app.resources.limits.memory | string | `"5Gi"` |  |
| app.resources.requests.cpu | string | `"500m"` |  |
| app.resources.requests.memory | string | `"512Mi"` |  |
| app.uid | int | `3005` | Runtime user |
| config.igdb.clientId | string | `nil` | IGDB client ID |
| config.igdb.clientSecret | string | `nil` | IGDB client secret |
| config.oidc.clientId | string | `nil` | App client ID |
| config.oidc.clientSecret | string | `nil` | App client secret |
| config.oidc.redirectUri | string | `nil` |  |
| config.oidc.serverApplicationUrl | string | `nil` |  |
| config.oidc.tlsCaCertFile | string | `nil` | Path to OIDC certificate |
| config.rommAuthSecretKey | string | `nil` |  |
| config.steamGridApiKey | string | `nil` | Steam grid API key |
| database.host | string | `nil` | Database URL |
| database.instanceName | string | `nil` | Database deployment name |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` | Database namespace |
| database.password | string | `nil` | Database password |
| database.port | int | `3306` | Database port |
| database.type | string | `"mariadb"` | Kind of database |
| database.username | string | `nil` | Database username |
| ingress.baseUrl | string | `nil` |  |
| redis.password | string | `nil` | Redis password |
| redis.port | int | `6379` | Redis port |
| redis.replicaCount | int | `1` | Number of Redis pods |
| redis.resources.limits.memory | string | `"512Mi"` |  |
| redis.resources.requests.cpu | string | `"250m"` |  |
| redis.resources.requests.memory | string | `"128Mi"` |  |
| service.port | int | `8080` |  |
| storage.assets.existingPvcName | string | `nil` |  |
| storage.assets.size | string | `nil` |  |
| storage.config.existingPvcName | string | `nil` |  |
| storage.config.size | string | `nil` |  |
| storage.games.password | string | `nil` |  |
| storage.games.smbUrl | string | `nil` |  |
| storage.games.username | string | `nil` |  |
| storage.resources.existingPvcName | string | `nil` |  |
| storage.resources.size | string | `nil` |  |
