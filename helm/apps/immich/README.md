# Immich

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Immich. Connecting to a clustered CNPG postgres database.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.8.0 |
| file://../../library/cnpg | cnpg | 0.3.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |
| file://../../library/redis | redis | 0.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.component | string | `"frontend"` | Component of the application being configured (e.g., frontend, backend) |
| app.gid | int | `572400077` | Group ID for the container |
| app.image.pullPolicy | string | `"IfNotPresent"` |  |
| app.image.repository | string | `"ghcr.io/immich-app/immich-server"` | Docker image repository for the application |
| app.image.tag | string | `"v3.2.0"` | Docker image tag (can be left empty to use the latest version) |
| app.livenessProbe.httpGet.path | string | `"/api/server/ping"` | Path to the health check endpoint |
| app.livenessProbe.httpGet.port | int | `2283` | Port used for the liveness probe |
| app.livenessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the liveness probe |
| app.livenessProbe.initialDelaySeconds | int | `15` | Delay before starting the liveness probe |
| app.livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| app.name | string | `"immich"` | Name of the application |
| app.readinessProbe.httpGet.path | string | `"/api/server/ping"` | Path to the health check endpoint |
| app.readinessProbe.httpGet.port | int | `2283` | Port used for the readiness probe |
| app.readinessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the readiness probe |
| app.readinessProbe.initialDelaySeconds | int | `5` | Delay before starting the readiness probe |
| app.readinessProbe.periodSeconds | int | `5` | Frequency of the readiness probe |
| app.replicaCount | int | `1` | Number of replicas to deploy for the application |
| app.resources.limits.memory | string | `"2Gi"` | Maximum memory resources allowed for the container |
| app.resources.requests.cpu | string | `"500m"` | Minimum CPU resources required by the container |
| app.resources.requests.memory | string | `"512Mi"` | Minimum memory resources required by the container |
| app.route.baseUrl | string | `nil` | Base URL for the service |
| app.route.port | int | `2283` | Port used for the route |
| app.route.rules[0].path | string | `"/"` |  |
| app.service.ports[0].name | string | `"http"` |  |
| app.service.ports[0].port | int | `2283` | Port exposed by the service |
| app.service.ports[0].protocol | string | `"TCP"` | Protocol used for the service |
| app.service.ports[0].targetPort | int | `2283` | Port the container is listening on |
| app.uid | int | `572400040` |  |
| config.machineLearning.url | string | `nil` |  |
| machineLearning.component | string | `"machinelearning"` |  |
| machineLearning.image.pullPolicy | string | `"IfNotPresent"` |  |
| machineLearning.image.repository | string | `"ghcr.io/immich-app/immich-machine-learning"` | Docker image repository for the application |
| machineLearning.image.tag | string | `"v3-openvino"` | Docker image tag (can be left empty to use the latest version) |
| machineLearning.name | string | `"immich"` |  |
| machineLearning.replicaCount | int | `1` |  |
| machineLearning.resources.limits.memory | string | `"2Gi"` | Maximum memory resources allowed for the container |
| machineLearning.resources.requests.cpu | string | `"500m"` | Minimum CPU resources required by the container |
| machineLearning.resources.requests.memory | string | `"512Mi"` | Minimum memory resources required by the container |
| machineLearning.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| machineLearning.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| machineLearning.securityContext.runAsGroup | int | `1001` |  |
| machineLearning.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| machineLearning.service.ports[0].name | string | `"api"` |  |
| machineLearning.service.ports[0].port | int | `3003` | Port exposed by the service |
| machineLearning.service.ports[0].protocol | string | `"TCP"` | Protocol used for the service |
| machineLearning.service.ports[0].targetPort | int | `3003` | Port the container is listening on |
| mainDb.clusterName | string | `nil` |  |
| mainDb.extensions[0].ensure | string | `"present"` |  |
| mainDb.extensions[0].name | string | `"vchord"` |  |
| mainDb.host | string | `nil` | Fully qualified domain name (FQDN) to the database |
| mainDb.name | string | `nil` | Name of the database |
| mainDb.namespace | string | `nil` | Kubernetes namespace where the database is deployed |
| mainDb.owner | string | `nil` | Username used to connect to the database |
| mainDb.password | string | `nil` | Password used to connect to the database |
| mainDb.port | int | `5432` | Port used to connect to the database |
| redis.password | string | `"kdz5BTV6zH9njNkcaqNFszJ5"` |  |
| redis.port | int | `6379` |  |
| redis.replicaCount | int | `1` |  |
| redis.user | string | `"default"` |  |
| storage.nfs.path | string | `nil` |  |
| storage.nfs.server | string | `nil` |  |
| storage.smb.password | string | `nil` |  |
| storage.smb.share | string | `nil` |  |
| storage.smb.url | string | `nil` |  |
| storage.smb.username | string | `nil` |  |
