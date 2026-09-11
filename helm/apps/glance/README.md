# Glance

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Glance.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.8.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.component | string | `"frontend"` | Component of the application being configured (e.g., frontend, backend) |
| app.gid | int | `1001` | Group ID for the container |
| app.image.pullPolicy | string | `"Always"` |  |
| app.image.repository | string | `"glanceapp/glance"` | Docker image repository for the application |
| app.image.tag | string | `"v0.8.6"` | Docker image tag (can be left empty to use the latest version) |
| app.livenessProbe.httpGet.path | string | `"/"` | Path to the health check endpoint |
| app.livenessProbe.httpGet.port | int | `8080` | Port used for the liveness probe |
| app.livenessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the liveness probe |
| app.livenessProbe.initialDelaySeconds | int | `15` | Delay before starting the liveness probe |
| app.livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| app.name | string | `"glance"` | Name of the application |
| app.readinessProbe.httpGet.path | string | `"/"` | Path to the health check endpoint |
| app.readinessProbe.httpGet.port | int | `8080` | Port used for the readiness probe |
| app.readinessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the readiness probe |
| app.readinessProbe.initialDelaySeconds | int | `2` | Delay before starting the readiness probe |
| app.readinessProbe.periodSeconds | int | `5` | Frequency of the readiness probe |
| app.replicaCount | int | `1` | Number of replicas to deploy for the application |
| app.resources.limits.memory | string | `"256Mi"` | Maximum memory resources allowed for the container |
| app.resources.requests.cpu | string | `"250m"` | Minimum CPU resources required by the container |
| app.resources.requests.memory | string | `"64Mi"` | Minimum memory resources required by the container |
| app.route.baseUrl | string | `nil` | Base URL for the service |
| app.route.port | int | `8080` | Port used for the route |
| app.route.rules[0].forwardAuth | bool | `true` |  |
| app.route.rules[0].name | string | `"root"` |  |
| app.route.rules[0].path | string | `"/"` |  |
| app.route.rules[0].statusRewrite | bool | `true` |  |
| app.service.ports[0].name | string | `"http"` |  |
| app.service.ports[0].port | int | `8080` | Port exposed by the service |
| app.service.ports[0].protocol | string | `"TCP"` | Protocol used for the service |
| app.service.ports[0].targetPort | int | `8080` | Port the container is listening on |
| app.uid | int | `1001` |  |
