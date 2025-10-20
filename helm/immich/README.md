# Immich

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.0.0](https://img.shields.io/badge/AppVersion-v2.0.0-informational?style=flat-square)

A Helm chart for Immich. Connecting to a clustered CNPG postgres database.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | string | `nil` | Runtime group |
| app.image.pullPolicy | string | `"Always"` | Image pull policy |
| app.image.repository | string | `"ghcr.io/immich-app/immich-server"` | App image |
| app.image.tag | string | `"release"` | Image version |
| app.name | string | `"immich"` | App name |
| app.replicaCount | int | `1` | Number of pods |
| app.resources.limits.memory | string | `"2Gi"` |  |
| app.resources.requests.cpu | string | `"500m"` |  |
| app.resources.requests.memory | string | `"512Mi"` |  |
| app.uid | string | `nil` | Runtime user |
| config.machineLearning.url | string | `nil` |  |
| config.smbPassword | string | `nil` | Samba password |
| config.smbUser | string | `nil` | Samba username |
| database.host | string | `nil` | Database URL |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` | Database namespace |
| database.password | string | `nil` | Database password |
| database.username | string | `nil` | Database username |
| ingress.baseUrl | string | `nil` | FQDN for the application |
| redis.existingPvcName | string | `nil` |  |
| redis.image.repository | string | `"11notes/redis"` | Redis image |
| redis.image.tag | string | `"7.4.5"` | Redis image version |
| redis.password | string | `nil` | Redis password |
| redis.port | int | `6379` | Redis port |
| redis.replicaCount | int | `1` | Number of redis pods |
| redis.resources.limits.memory | string | `"256Mi"` |  |
| redis.resources.requests.cpu | string | `"250m"` |  |
| redis.resources.requests.memory | string | `"64Mi"` |  |
| redis.user | string | `"default"` | Redis username |
| service.port | int | `2283` | App port |
| storage.smb.url | string | `nil` | Samba share URL |
