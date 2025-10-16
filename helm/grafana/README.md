# Grafana

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Grafana. The database is handled by a clustered MariaDB deployment.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.name | string | `"grafana"` | App name |
| config.datasource.tlsSkipVerify | bool | `true` |  |
| config.datasource.vl.name | string | `"victoriametrics-logs-datasource"` |  |
| config.datasource.vl.url | string | `nil` |  |
| config.datasource.vl.version | string | `"0.19.2"` |  |
| config.datasource.vm.name | string | `"victoriametrics-metrics-datasource"` |  |
| config.datasource.vm.url | string | `nil` |  |
| config.datasource.vm.version | string | `"0.18.2"` |  |
| config.oidc.clientSecret | string | `nil` | App client secret |
| config.oidc.issuerUrl | string | `nil` |  |
| database.host | string | `nil` |  |
| database.instanceName | string | `nil` |  |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` |  |
| database.password | string | `nil` |  |
| database.port | int | `3306` | Database port |
| database.type | string | `"mysql"` | Kind of database |
| database.username | string | `nil` | Database username |
| ingress.baseUrl | string | `nil` |  |
| service.port | int | `3000` |  |
