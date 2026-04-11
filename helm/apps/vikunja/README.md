# Vikunja

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.3.0](https://img.shields.io/badge/AppVersion-2.3.0-informational?style=flat-square)

A Helm chart for Vikunja.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.1.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |
| file://../../library/mariadb | database(mariadb) | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1000` | Runtime group |
| app.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| app.image.repository | string | `"vikunja/vikunja"` | App image |
| app.image.tag | string | `"1.0.0-rc2"` | App version |
| app.livenessProbe.httpGet.path | string | `"/favico.ico"` |  |
| app.livenessProbe.httpGet.port | int | `3456` |  |
| app.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| app.livenessProbe.initialDelaySeconds | int | `15` |  |
| app.livenessProbe.periodSeconds | int | `10` |  |
| app.name | string | `"vikunja"` | App name |
| app.readinessProbe.httpGet.path | string | `"/favico.ico"` |  |
| app.readinessProbe.httpGet.port | int | `3456` |  |
| app.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| app.readinessProbe.initialDelaySeconds | int | `10` |  |
| app.readinessProbe.periodSeconds | int | `10` |  |
| app.replicaCount | int | `1` | Number of pods |
| app.resources.limits.memory | string | `"512Mi"` |  |
| app.resources.requests.cpu | string | `"250m"` |  |
| app.resources.requests.memory | string | `"256Mi"` |  |
| app.uid | int | `1000` | Runtime user |
| config.oidc.clientID | string | `nil` | App client ID |
| config.oidc.clientSecret | string | `nil` | App client secret |
| config.oidc.url | string | `nil` | URL to OIDC endpoint |
| database.host | string | `nil` | Database url |
| database.instanceName | string | `nil` | Database deployment name |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` | Database namespace |
| database.password | string | `nil` | Database password |
| database.passwordKey | string | `nil` |  |
| database.type | string | `nil` | Kind of database |
| database.username | string | `nil` | Database username |
| ingress.baseUrl | string | `nil` | FQDN for application |
| service.port | int | `3456` | App port |
| storage.files | string | `nil` |  |
