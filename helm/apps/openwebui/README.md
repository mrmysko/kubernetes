# openwebui

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Open WebUI

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
| app.gid | int | `1001` | Group ID for the container |
| app.image.pullPolicy | string | `"IfNotPresent"` |  |
| app.image.repository | string | `"ghcr.io/open-webui/open-webui"` | Docker image repository for the application |
| app.image.tag | string | `"v0.11.3"` | Docker image tag (can be left empty to use the latest version) |
| app.livenessProbe.httpGet.path | string | `"/health"` | Path to the health check endpoint |
| app.livenessProbe.httpGet.port | int | `3000` | Port used for the liveness probe |
| app.livenessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the liveness probe |
| app.livenessProbe.initialDelaySeconds | int | `15` | Delay before starting the liveness probe |
| app.livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| app.name | string | `"openwebui"` | Name of the application |
| app.readinessProbe.httpGet.path | string | `"/health"` | Path to the health check endpoint |
| app.readinessProbe.httpGet.port | int | `3000` | Port used for the readiness probe |
| app.readinessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the readiness probe |
| app.readinessProbe.initialDelaySeconds | int | `2` | Delay before starting the readiness probe |
| app.readinessProbe.periodSeconds | int | `5` | Frequency of the readiness probe |
| app.replicaCount | int | `1` | Number of replicas to deploy for the application |
| app.route.baseUrl | string | `nil` | Base URL for the service |
| app.route.port | int | `3000` | Port used for the route |
| app.route.rules[0].path | string | `"/"` |  |
| app.service.ports[0].name | string | `"http"` |  |
| app.service.ports[0].port | int | `3000` | Port exposed by the service |
| app.service.ports[0].protocol | string | `"TCP"` | Protocol used for the service |
| app.service.ports[0].targetPort | int | `3000` | Port the container is listening on |
| app.uid | int | `1001` | User ID for the container |
| config.oidc.clientId | string | `"openwebui"` |  |
| config.oidc.clientSecret | string | `nil` |  |
| config.oidc.logoutUrl | string | `nil` |  |
| config.oidc.redirectUrl | string | `nil` |  |
| config.oidc.url | string | `nil` |  |
| config.webUI.admin.name | string | `nil` |  |
| config.webUI.admin.password | string | `nil` |  |
| config.webUI.secretKey | string | `nil` |  |
| mainDb.clusterName | string | `nil` |  |
| mainDb.host | string | `nil` | Fully qualified domain name (FQDN) to the database |
| mainDb.name | string | `nil` | Name of the database |
| mainDb.namespace | string | `nil` | Kubernetes namespace where the database is deployed |
| mainDb.owner | string | `nil` | Username used to connect to the database |
| mainDb.password | string | `nil` | Password used to connect to the database |
| mainDb.port | int | `5432` | Port used to connect to the database |
| redis.password | string | `nil` |  |
| redis.port | int | `6379` |  |
| redis.replicaCount | int | `1` |  |
| redis.username | string | `"default"` |  |
| storage.data.existingClaim | string | `"pvc-c5696362-71b0-4e92-b277-234bf531c5a6"` |  |
| vectorDb.clusterName | string | `nil` |  |
| vectorDb.extensions[0].ensure | string | `"present"` |  |
| vectorDb.extensions[0].name | string | `"vector"` |  |
| vectorDb.host | string | `nil` | Fully qualified domain name (FQDN) to the database |
| vectorDb.name | string | `nil` | Name of the database |
| vectorDb.namespace | string | `nil` | Kubernetes namespace where the database is deployed |
| vectorDb.owner | string | `nil` | Username used to connect to the database |
| vectorDb.password | string | `nil` | Password used to connect to the database |
| vectorDb.port | int | `5432` | Port used to connect to the database |
