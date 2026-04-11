# Immich

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.7.3](https://img.shields.io/badge/AppVersion-v2.7.3-informational?style=flat-square)

A Helm chart for Immich. Connecting to a clustered CNPG postgres database.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.1.0 |
| file://../../library/cnpg-database | mainDb(cnpg-database) | 0.1.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |
| file://../../library/redis | redis | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | string | `nil` | Runtime group |
| app.image.pullPolicy | string | `"Always"` | Image pull policy |
| app.image.repository | string | `"ghcr.io/immich-app/immich-server"` | App image |
| app.image.tag | string | `"release"` | Image version |
| app.livenessProbe.httpGet.path | string | `"/api/server/ping"` |  |
| app.livenessProbe.httpGet.port | int | `2283` |  |
| app.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| app.livenessProbe.initialDelaySeconds | int | `15` |  |
| app.livenessProbe.periodSeconds | int | `10` |  |
| app.name | string | `"immich"` | App name |
| app.readinessProbe.httpGet.path | string | `"/api/server/ping"` |  |
| app.readinessProbe.httpGet.port | int | `2283` |  |
| app.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| app.readinessProbe.initialDelaySeconds | int | `5` |  |
| app.readinessProbe.periodSeconds | int | `5` |  |
| app.replicaCount | int | `1` | Number of pods |
| app.resources.limits.memory | string | `"2Gi"` |  |
| app.resources.requests.cpu | string | `"500m"` |  |
| app.resources.requests.memory | string | `"512Mi"` |  |
| app.uid | string | `nil` | Runtime user |
| config.machineLearning.url | string | `nil` |  |
| database.host | string | `nil` | Database URL |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` | Database namespace |
| database.password | string | `nil` | Database password |
| database.username | string | `nil` | Database username |
| ingress.baseUrl | string | `nil` | FQDN for the application |
| redis.password | string | `nil` | Redis password |
| redis.port | int | `6379` | Redis port |
| redis.replicaCount | int | `1` | Number of redis pods |
| redis.user | string | `"default"` | Redis username |
| service.port | int | `2283` | App port |
| storage.smb.password | string | `nil` | Samba password |
| storage.smb.share | string | `nil` |  |
| storage.smb.url | string | `nil` | Samba share URL |
| storage.smb.username | string | `nil` | Samba username |
