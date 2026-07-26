# AudioMuse

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7](https://img.shields.io/badge/AppVersion-7-informational?style=flat-square)

A chart for AudioMuse-AI

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.5.0 |
| file://../../library/cnpg | cnpg | 0.2.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |
| file://../../library/redis | redis | 0.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| frontend.component | string | `"frontend"` |  |
| frontend.gid | int | `1001` |  |
| frontend.image.pullPolicy | string | `"Always"` |  |
| frontend.image.repository | string | `"ghcr.io/neptunehub/audiomuse-ai"` |  |
| frontend.image.tag | string | `"3.0.5"` |  |
| frontend.livenessProbe.httpGet.path | string | `"/"` |  |
| frontend.livenessProbe.httpGet.port | int | `8000` |  |
| frontend.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| frontend.livenessProbe.initialDelaySeconds | int | `15` |  |
| frontend.livenessProbe.periodSeconds | int | `10` |  |
| frontend.name | string | `"audiomuse"` |  |
| frontend.readinessProbe.httpGet.path | string | `"/"` |  |
| frontend.readinessProbe.httpGet.port | int | `8000` |  |
| frontend.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| frontend.readinessProbe.initialDelaySeconds | int | `2` |  |
| frontend.readinessProbe.periodSeconds | int | `5` |  |
| frontend.replicaCount | int | `1` |  |
| frontend.resources.limits.memory | string | `"2Gi"` |  |
| frontend.resources.requests.cpu | string | `"500m"` |  |
| frontend.resources.requests.memory | string | `"128Mi"` |  |
| frontend.route.baseUrl | string | `nil` |  |
| frontend.route.port | int | `8000` |  |
| frontend.route.rules[0].forwardAuth | bool | `false` |  |
| frontend.route.rules[0].path | string | `"/"` |  |
| frontend.service.ports[0].name | string | `"http"` |  |
| frontend.service.ports[0].port | int | `8000` |  |
| frontend.service.ports[0].protocol | string | `"TCP"` |  |
| frontend.service.ports[0].targetPort | int | `8000` |  |
| frontend.uid | int | `1001` |  |
| mainDb.clusterName | string | `nil` |  |
| mainDb.host | string | `nil` |  |
| mainDb.name | string | `nil` |  |
| mainDb.namespace | string | `nil` |  |
| mainDb.owner | string | `nil` |  |
| mainDb.password | string | `nil` |  |
| mainDb.port | string | `nil` |  |
| redis.password | string | `nil` |  |
| redis.port | int | `6379` |  |
| redis.replicaCount | int | `1` |  |
| redis.username | string | `"default"` |  |
| worker.component | string | `"worker"` |  |
| worker.image.pullPolicy | string | `"Always"` |  |
| worker.image.repository | string | `"ghcr.io/neptunehub/audiomuse-ai"` |  |
| worker.image.tag | string | `"3.0.5"` |  |
| worker.name | string | `"audiomuse"` |  |
| worker.replicaCount | int | `1` |  |
| worker.resources.limits.memory | string | `"2Gi"` |  |
| worker.resources.requests.cpu | string | `"1"` |  |
| worker.resources.requests.memory | string | `"128Mi"` |  |
| worker.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| worker.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| worker.securityContext.runAsGroup | int | `1001` |  |
| worker.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
