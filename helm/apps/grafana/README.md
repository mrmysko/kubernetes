# Grafana

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Grafana. The database is handled by a clustered MariaDB deployment.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.8.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |
| file://../../library/mariadb | database(mariadb) | 0.3.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.image.repository | string | `"grafana/grafana"` | Docker image repository for the application |
| app.image.tag | string | `"13.2.0"` | Docker image tag (can be left empty to use the latest version) |
| app.livenessProbe.httpGet.path | string | `"/api/health"` | Path to the health check endpoint |
| app.livenessProbe.httpGet.port | int | `3000` | Port used for the liveness probe |
| app.livenessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the liveness probe |
| app.livenessProbe.initialDelaySeconds | int | `10` | Delay before starting the liveness probe |
| app.livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| app.name | string | `"grafana"` | Name of the application |
| app.readinessProbe.httpGet.path | string | `"/api/health"` | Path to the health check endpoint |
| app.readinessProbe.httpGet.port | int | `3000` | Port used for the readiness probe |
| app.readinessProbe.httpGet.scheme | string | `"HTTP"` | Protocol used for the readiness probe |
| app.readinessProbe.initialDelaySeconds | int | `10` | Delay before starting the readiness probe |
| app.readinessProbe.periodSeconds | int | `10` | Frequency of the readiness probe |
| app.route.baseUrl | string | `nil` |  |
| app.route.port | int | `3000` | Port exposed by the service |
| app.route.rules[0].name | string | `"root"` |  |
| app.route.rules[0].path | string | `"/"` |  |
| app.route.serviceOverride | string | `"grafana-service"` |  |
| app.service.ports[0].name | string | `"grafana-http"` |  |
| app.service.ports[0].port | int | `3000` |  |
| app.service.ports[0].protocol | string | `"TCP"` |  |
| app.service.ports[0].targetPort | int | `3000` |  |
| config.admin.password | string | `nil` |  |
| config.admin.user | string | `nil` |  |
| config.contactpoint.mailAddress | string | `nil` |  |
| config.oidc.clientId | string | `nil` |  |
| config.oidc.clientSecret | string | `nil` |  |
| config.oidc.url | string | `nil` |  |
| dashboards[0].datasources[0].datasourceName | string | `"victoriametrics"` |  |
| dashboards[0].datasources[0].inputName | string | `"DS__VICTORIAMETRICS-PROD-ALL"` |  |
| dashboards[0].folder | string | `"Imports"` |  |
| dashboards[0].id | int | `10229` |  |
| dashboards[0].name | string | `"victoriametrics-single-node"` |  |
| dashboards[1].datasources[0].datasourceName | string | `"victoriametrics"` |  |
| dashboards[1].datasources[0].inputName | string | `"DS__VICTORIAMETRICS-PROD-ALL"` |  |
| dashboards[1].folder | string | `"Imports"` |  |
| dashboards[1].id | int | `15661` |  |
| dashboards[1].name | string | `"kubernetes-cluster-monitoring-via-prometheus"` |  |
| database.host | string | `nil` | Fully qualified domain name (FQDN) to the database |
| database.instanceName | string | `nil` | Name of the database instance |
| database.name | string | `"grafana"` | Name of the database |
| database.namespace | string | `nil` | Kubernetes namespace where the database is deployed |
| database.password | string | `nil` | Password used to connect to the database |
| database.passwordKey | string | `"MYSQL_PASSWORD"` | Key used to reference the password in a secret |
| database.port | int | `3306` | Port used to connect to the database |
| database.type | string | `"mysql"` | Type of database (e.g., mariadb, postgresql) |
| database.username | string | `nil` | Username used to connect to the database |
| datasource[0].name | string | `"victoriametrics"` |  |
| datasource[0].pluginName | string | `"victoriametrics-metrics-datasource"` |  |
| datasource[0].url | string | `nil` |  |
| datasource[0].version | string | `"0.25.2"` |  |
| datasource[1].name | string | `"victorialogs"` |  |
| datasource[1].pluginName | string | `"victoriametrics-logs-datasource"` |  |
| datasource[1].type | string | `"victoriametrics-logs-datasource"` |  |
| datasource[1].url | string | `nil` |  |
| datasource[1].version | string | `"0.31.0"` |  |
| smtp.enabled | bool | `true` |  |
| smtp.fromAddress | string | `nil` | Email address used to send notifications |
| smtp.host | string | `nil` | SMTP server address |
| smtp.password | string | `nil` |  |
| smtp.user | string | `nil` | Username used to connect to the SMTP server |
