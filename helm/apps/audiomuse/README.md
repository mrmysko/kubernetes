# AudioMuse

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A chart for AudioMuse-AI

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.8.0 |
| file://../../library/cnpg | cnpg | 0.3.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| frontend.component | string | `"frontend"` | Component of the application being configured (e.g., frontend, backend) |
| frontend.gid | int | `1001` | Group ID for the container |
| frontend.image.pullPolicy | string | `"Always"` |  |
| frontend.image.repository | string | `"ghcr.io/neptunehub/audiomuse-ai"` | Docker image repository for the application |
| frontend.image.tag | string | `"3.5.2"` | Docker image tag (can be left empty to use the latest version) |
| frontend.livenessProbe.httpGet.path | string | `"/api/health"` | Path to the health check endpoint |
| frontend.livenessProbe.httpGet.port | int | `8000` | Port used for the liveness probe |
| frontend.livenessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the liveness probe |
| frontend.livenessProbe.initialDelaySeconds | int | `15` | Delay before starting the liveness probe |
| frontend.livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| frontend.name | string | `"audiomuse"` | Name of the application |
| frontend.readinessProbe.httpGet.path | string | `"/api/health"` | Path to the health check endpoint |
| frontend.readinessProbe.httpGet.port | int | `8000` | Port used for the readiness probe |
| frontend.readinessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the readiness probe |
| frontend.readinessProbe.initialDelaySeconds | int | `2` | Delay before starting the readiness probe |
| frontend.readinessProbe.periodSeconds | int | `5` | Frequency of the readiness probe |
| frontend.replicaCount | int | `1` | Number of replicas to deploy for the application |
| frontend.resources.limits.memory | string | `"3Gi"` | Maximum memory resources allowed for the container |
| frontend.resources.requests.cpu | string | `"500m"` | Minimum CPU resources required by the container |
| frontend.resources.requests.memory | string | `"128Mi"` | Minimum memory resources required by the container |
| frontend.route.baseUrl | string | `nil` | Base URL for the service |
| frontend.route.port | int | `8000` | Port used for the route |
| frontend.route.rules[0].forwardAuth | bool | `true` |  |
| frontend.route.rules[0].name | string | `"root"` |  |
| frontend.route.rules[0].path | string | `"/"` |  |
| frontend.route.rules[0].statusRewrite | bool | `true` |  |
| frontend.service.ports[0].name | string | `"http"` |  |
| frontend.service.ports[0].port | int | `8000` | Port exposed by the service |
| frontend.service.ports[0].protocol | string | `"TCP"` | Protocol used for the service |
| frontend.service.ports[0].targetPort | int | `8000` | Port the container is listening on |
| frontend.uid | int | `1001` | User ID for the container |
| mainDb.clusterName | string | `nil` |  |
| mainDb.host | string | `nil` | Fully qualified domain name (FQDN) to the database |
| mainDb.name | string | `nil` | Name of the database |
| mainDb.namespace | string | `nil` | Kubernetes namespace where the database is deployed |
| mainDb.owner | string | `nil` | Username used to connect to the database |
| mainDb.password | string | `nil` | Password used to connect to the database |
| mainDb.port | int | `5432` | Port used to connect to the database |
| worker.component | string | `"worker"` | Component of the application being configured (e.g., frontend, backend) |
| worker.image.pullPolicy | string | `"Always"` |  |
| worker.image.repository | string | `"ghcr.io/neptunehub/audiomuse-ai"` |  |
| worker.image.tag | string | `nil` |  |
| worker.name | string | `"audiomuse"` | Name of the application |
| worker.replicaCount | int | `2` | Number of replicas to deploy for the application |
| worker.resources.limits.memory | string | `"4Gi"` |  |
| worker.resources.requests.cpu | string | `"1"` |  |
| worker.resources.requests.memory | string | `"128Mi"` |  |
| worker.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| worker.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| worker.securityContext.runAsGroup | int | `1001` |  |
| worker.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
