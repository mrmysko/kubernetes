# Vikunja

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Vikunja.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.8.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |
| file://../../library/mariadb | database(mariadb) | 0.3.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.component | string | `"frontend"` | Component of the application being configured (e.g., frontend, backend) |
| app.gid | int | `1000` | Group ID for the container |
| app.image.pullPolicy | string | `"IfNotPresent"` |  |
| app.image.repository | string | `"vikunja/vikunja"` | Docker image repository for the application |
| app.image.tag | string | `"2.5.0"` | Docker image tag (can be left empty to use the latest version) |
| app.livenessProbe.httpGet.path | string | `"/favico.ico"` | Path to the health check endpoint |
| app.livenessProbe.httpGet.port | int | `3456` | Port used for the liveness probe |
| app.livenessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the liveness probe |
| app.livenessProbe.initialDelaySeconds | int | `15` | Delay before starting the liveness probe |
| app.livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| app.name | string | `"vikunja"` | Name of the application |
| app.readinessProbe.httpGet.path | string | `"/favico.ico"` | Path to the health check endpoint |
| app.readinessProbe.httpGet.port | int | `3456` | Port used for the readiness probe |
| app.readinessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the readiness probe |
| app.readinessProbe.initialDelaySeconds | int | `10` | Delay before starting the readiness probe |
| app.readinessProbe.periodSeconds | int | `10` | Frequency of the readiness probe |
| app.replicaCount | int | `1` | Number of replicas to deploy for the application |
| app.resources.limits.memory | string | `"512Mi"` | Maximum memory resources allowed for the container |
| app.resources.requests.cpu | string | `"250m"` | Minimum CPU resources required by the container |
| app.resources.requests.memory | string | `"256Mi"` | Minimum memory resources required by the container |
| app.route.baseUrl | string | `nil` | Base URL for the service |
| app.route.port | int | `3456` | Port used for the route |
| app.route.rules[0].path | string | `"/"` |  |
| app.service.ports[0].name | string | `"http"` |  |
| app.service.ports[0].port | int | `3456` | Port exposed by the service |
| app.service.ports[0].protocol | string | `"TCP"` | Protocol used for the service |
| app.service.ports[0].targetPort | int | `3456` | Port the container is listening on |
| app.uid | int | `1000` | User ID for the container |
| config.oidc.clientID | string | `nil` |  |
| config.oidc.clientSecret | string | `nil` |  |
| config.oidc.url | string | `nil` |  |
| database.host | string | `nil` | Fully qualified domain name (FQDN) to the database |
| database.instanceName | string | `nil` | Name of the database instance |
| database.name | string | `nil` | Name of the database |
| database.namespace | string | `nil` | Kubernetes namespace where the database is deployed |
| database.password | string | `nil` | Password used to connect to the database |
| database.passwordKey | string | `"VIKUNJA_DATABASE_PASSWORD"` | Key used to reference the password in a secret |
| database.type | string | `"mysql"` | Type of database (e.g., mariadb, postgresql) |
| database.username | string | `nil` | Username used to connect to the database |
| storage.files | string | `nil` |  |
