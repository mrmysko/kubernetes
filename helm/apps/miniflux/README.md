# Miniflux

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.2.19](https://img.shields.io/badge/AppVersion-2.2.19-informational?style=flat-square)

A Helm chart for Miniflux RSS-reader. Connecting to a clustered CNPG postgres database.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.1.0 |
| file://../../library/cnpg-database | mainDb(cnpg-database) | 0.1.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1001` | Runtime group |
| app.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| app.image.repository | string | `"miniflux/miniflux"` | App image |
| app.image.tag | string | `"2.2.13"` | App version |
| app.livenessProbe.httpGet.path | string | `"/liveness"` |  |
| app.livenessProbe.httpGet.port | int | `443` |  |
| app.livenessProbe.httpGet.scheme | string | `"HTTPS"` |  |
| app.livenessProbe.initialDelaySeconds | int | `5` |  |
| app.livenessProbe.periodSeconds | int | `10` |  |
| app.name | string | `"miniflux"` | App name |
| app.readinessProbe.httpGet.path | string | `"/readiness"` |  |
| app.readinessProbe.httpGet.port | int | `443` |  |
| app.readinessProbe.httpGet.scheme | string | `"HTTPS"` |  |
| app.readinessProbe.initialDelaySeconds | int | `5` |  |
| app.readinessProbe.periodSeconds | int | `10` |  |
| app.replicaCount | int | `1` | Number of pods |
| app.uid | int | `1001` | Runtime user |
| env.baseUrl | string | `nil` | FQDN to application, with scheme |
| env.oidc.clientID | string | `nil` | App client ID |
| env.oidc.clientSecret | string | `nil` | App client secret |
| env.oidc.endpoint | string | `nil` | URL to OIDC endpoint, without discovery |
| env.oidc.name | string | `nil` | Name of OIDC application |
| env.oidc.redirectURL | string | `nil` | App redirect URL |
| mainDb.clusterName | string | `nil` |  |
| mainDb.extensions[0].ensure | string | `"present"` |  |
| mainDb.extensions[0].name | string | `"hstore"` |  |
| mainDb.host | string | `nil` | Database url |
| mainDb.name | string | `"miniflux"` | Database name |
| mainDb.namespace | string | `nil` | Database namespace |
| mainDb.owner | string | `nil` | Database user |
| mainDb.password | string | `nil` | Database password |
| mainDb.port | int | `5432` |  |
| service.port | int | `8080` | App port |
