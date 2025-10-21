# FreshRSS

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for FreshRSS. The database is handled by a clustered MariaDB deployment.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `33` | Runtime group |
| app.image.pullPolicy | string | `"Always"` | Image pull policy |
| app.image.repository | string | `"ghcr.io/mrmysko/docker-compost/789548356823"` | App image |
| app.image.tag | string | `"latest"` | Image version |
| app.name | string | `"freshrss"` |  |
| app.replicaCount | int | `2` | Number of pods |
| app.resources.limits.memory | string | `"512Mi"` |  |
| app.resources.requests.cpu | string | `"250m"` |  |
| app.resources.requests.memory | string | `"128Mi"` |  |
| app.uid | int | `33` | Runtime user |
| config.oidc.clientId | string | `nil` | OIDC client ID |
| config.oidc.clientSecret | string | `nil` | OIDC client secret |
| config.oidc.cryptoKey | string | `nil` |  |
| config.oidc.url | string | `nil` | OIDC endpoint url, including discovery |
| config.trustedProxy | string | `nil` | IPs allowed to proxy to app |
| database.host | string | `nil` | FQDN to database |
| database.instanceName | string | `nil` | Database deployment name |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` | Database namespace |
| database.password | string | `nil` | Database password |
| database.port | int | `3306` | Database port |
| database.type | string | `nil` | Kind of database |
| database.username | string | `nil` | Database username |
| ingress.baseUrl | string | `nil` | FQDN to application |
| service.port | int | `8080` | App port |
| storage.data.existingPvcName | string | `nil` |  |
| storage.extensions.existingPvcName | string | `nil` |  |
