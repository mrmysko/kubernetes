# Miniflux

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Miniflux RSS-reader. Connecting to a clustered CNPG postgres database.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.8.0 |
| file://../../library/cnpg | cnpg | 0.3.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.component | string | `"frontend"` | Component of the application being configured (e.g., frontend, backend) |
| app.gid | int | `1001` | Group ID for the container |
| app.image.repository | string | `"miniflux/miniflux"` | Docker image repository for the application |
| app.image.tag | string | `"2.3.3"` | Docker image tag (can be left empty to use the latest version) |
| app.livenessProbe.httpGet.path | string | `"/liveness"` | Path to the health check endpoint |
| app.livenessProbe.httpGet.port | int | `443` | Port used for the liveness probe |
| app.livenessProbe.httpGet.scheme | string | `"HTTPS"` | Protocol used for the liveness probe |
| app.livenessProbe.initialDelaySeconds | int | `5` | Delay before starting the liveness probe |
| app.livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| app.name | string | `"miniflux"` | Name of the application |
| app.readinessProbe.httpGet.path | string | `"/readiness"` | Path to the health check endpoint |
| app.readinessProbe.httpGet.port | int | `443` | Port used for the readiness probe |
| app.readinessProbe.httpGet.scheme | string | `"HTTPS"` | Protocol used for the readiness probe |
| app.readinessProbe.initialDelaySeconds | int | `5` | Delay before starting the readiness probe |
| app.readinessProbe.periodSeconds | int | `10` | Frequency of the readiness probe |
| app.replicaCount | int | `1` | Number of replicas to deploy for the application |
| app.route.baseUrl | string | `nil` | Base URL for the service |
| app.route.port | int | `443` | Port used for the route |
| app.route.rules[0].path | string | `"/"` |  |
| app.service.ports[0].name | string | `"https"` |  |
| app.service.ports[0].port | int | `443` | Port exposed by the service |
| app.service.ports[0].protocol | string | `"TCP"` | Protocol used for the service |
| app.service.ports[0].targetPort | int | `443` | Port the container is listening on |
| app.uid | int | `1001` |  |
| env.oidc.clientID | string | `nil` |  |
| env.oidc.clientSecret | string | `nil` |  |
| env.oidc.name | string | `"OIDC"` |  |
| env.oidc.redirectUrl | string | `nil` |  |
| env.oidc.url | string | `nil` |  |
| mainDb.clusterName | string | `nil` |  |
| mainDb.extensions[0].ensure | string | `"present"` |  |
| mainDb.extensions[0].name | string | `"hstore"` |  |
| mainDb.host | string | `nil` | Fully qualified domain name (FQDN) to the database |
| mainDb.name | string | `nil` | Name of the database |
| mainDb.namespace | string | `nil` | Kubernetes namespace where the database is deployed |
| mainDb.owner | string | `nil` | Username used to connect to the database |
| mainDb.password | string | `nil` | Password used to connect to the database |
| mainDb.port | int | `5432` | Port used to connect to the database |
