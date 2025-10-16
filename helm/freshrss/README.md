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
| config.oidc.providerMetadataUrl | string | `nil` |  |
| config.trustedProxy | string | `nil` |  |
| database.host | string | `nil` |  |
| database.instanceName | string | `nil` |  |
| database.name | string | `nil` |  |
| database.namespace | string | `nil` |  |
| database.password | string | `nil` |  |
| database.port | int | `3306` |  |
| database.type | string | `nil` |  |
| database.username | string | `nil` |  |
| ingress.baseUrl | string | `nil` |  |
| service.port | int | `8080` | App port |
| storage.data.existingPvcName | string | `nil` |  |
| storage.extensions.existingPvcName | string | `nil` |  |
