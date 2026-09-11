# RomM

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for RomM.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.8.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |
| file://../../library/mariadb | mariadb | 0.3.0 |
| file://../../library/redis | redis | 0.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.component | string | `"frontend"` | Component of the application being configured (e.g., frontend, backend) |
| app.gid | int | `572400077` | Group ID for the container |
| app.image.repository | string | `"rommapp/romm"` | Docker image repository for the application |
| app.image.tag | string | `"5.2.0"` | Docker image tag (can be left empty to use the latest version) |
| app.livenessProbe.httpGet.path | string | `"/api/heartbeat"` | Path to the health check endpoint |
| app.livenessProbe.httpGet.port | int | `8080` | Port used for the liveness probe |
| app.livenessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the liveness probe |
| app.livenessProbe.initialDelaySeconds | int | `20` | Delay before starting the liveness probe |
| app.livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| app.name | string | `"romm"` | Name of the application |
| app.readinessProbe.httpGet.path | string | `"/api/heartbeat"` | Path to the health check endpoint |
| app.readinessProbe.httpGet.port | int | `8080` | Port used for the readiness probe |
| app.readinessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the readiness probe |
| app.readinessProbe.initialDelaySeconds | int | `15` | Delay before starting the readiness probe |
| app.readinessProbe.periodSeconds | int | `5` | Frequency of the readiness probe |
| app.replicaCount | int | `1` | Number of replicas to deploy for the application |
| app.resources.limits.memory | string | `"5Gi"` | Maximum memory resources allowed for the container |
| app.resources.requests.cpu | string | `"1000m"` | Minimum CPU resources required by the container |
| app.resources.requests.memory | string | `"512Mi"` | Minimum memory resources required by the container |
| app.route.baseUrl | string | `nil` | Base URL for the service |
| app.route.port | int | `8080` | Port used for the route |
| app.route.rules[0].path | string | `"/"` |  |
| app.service.ports[0].name | string | `"http"` |  |
| app.service.ports[0].port | int | `8080` | Port exposed by the service |
| app.service.ports[0].protocol | string | `"TCP"` | Protocol used for the service |
| app.service.ports[0].targetPort | int | `8080` | Port the container is listening on |
| app.uid | int | `572400039` | User ID for the container |
| config.igdb.clientId | string | `nil` |  |
| config.igdb.clientSecret | string | `nil` |  |
| config.oidc.clientId | string | `nil` |  |
| config.oidc.clientSecret | string | `nil` |  |
| config.oidc.redirectUri | string | `nil` |  |
| config.oidc.serverApplicationUrl | string | `nil` |  |
| config.oidc.tlsCaCertFile | string | `"/tmp/fullchain.pem"` |  |
| config.rommAuthSecretKey | string | `nil` |  |
| config.screenscraper.password | string | `nil` |  |
| config.screenscraper.user | string | `nil` |  |
| config.steamGridApiKey | string | `nil` |  |
| database.host | string | `nil` | Fully qualified domain name (FQDN) to the database |
| database.instanceName | string | `nil` | Name of the database instance |
| database.name | string | `nil` | Name of the database |
| database.namespace | string | `nil` | Kubernetes namespace where the database is deployed |
| database.password | string | `nil` | Password used to connect to the database |
| database.passwordKey | string | `"DB_PASSWD"` | Key used to reference the password in a secret |
| database.port | int | `3306` | Port used to connect to the database |
| database.type | string | `"mariadb"` | Type of database (e.g., mariadb, postgresql) |
| database.username | string | `nil` | Username used to connect to the database |
| redis.password | string | `nil` | Password used to connect to Redis |
| redis.port | int | `6379` | Port used to connect to Redis |
| storage.assets.size | string | `"3Gi"` |  |
| storage.assets.volumeName | string | `"pvc-8b409122-7e0a-4817-af58-c98dc74c1e0a"` |  |
| storage.config.size | string | `"1Gi"` |  |
| storage.config.volumeName | string | `"pvc-41ffd175-2fc7-4a96-8955-15e55ef818fb"` |  |
| storage.nfs.path | string | `nil` |  |
| storage.nfs.server | string | `nil` |  |
| storage.resources.size | string | `"15Gi"` |  |
| storage.resources.volumeName | string | `"pvc-2ef9a570-96d0-4329-ac49-d3d5293b5b11"` |  |
