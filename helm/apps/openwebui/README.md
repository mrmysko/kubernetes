# openwebui

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.8.12](https://img.shields.io/badge/AppVersion-v0.8.12-informational?style=flat-square)

A Helm chart for Open WebUI

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.1.0 |
| file://../../library/cnpg-database | mainDb(cnpg-database) | 0.1.0 |
| file://../../library/cnpg-database | vectorDb(cnpg-database) | 0.1.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1001` |  |
| app.image.pullPolicy | string | `"IfNotPresent"` |  |
| app.image.repository | string | `"ghcr.io/open-webui/open-webui"` |  |
| app.image.tag | string | `"v0.7.2"` |  |
| app.name | string | `"openwebui"` |  |
| app.replicaCount | int | `1` |  |
| app.uid | int | `1001` |  |
| config.oidc.clientId | string | `nil` |  |
| config.oidc.clientSecret | string | `nil` |  |
| config.oidc.redirectUrl | string | `nil` |  |
| config.oidc.url | string | `nil` |  |
| config.webUI.admin.name | string | `nil` |  |
| config.webUI.admin.password | string | `nil` |  |
| config.webUI.secretKey | string | `nil` |  |
| ingress.baseUrl | string | `nil` |  |
| mainDb.clusterName | string | `nil` |  |
| mainDb.host | string | `nil` |  |
| mainDb.name | string | `nil` |  |
| mainDb.namespace | string | `nil` |  |
| mainDb.owner | string | `nil` |  |
| mainDb.password | string | `nil` |  |
| mainDb.port | int | `5432` |  |
| service.port | int | `3000` |  |
| storage.data.volumeName | string | `nil` |  |
| vectorDb.clusterName | string | `nil` |  |
| vectorDb.extensions[0].ensure | string | `"present"` |  |
| vectorDb.extensions[0].name | string | `"vector"` |  |
| vectorDb.host | string | `nil` |  |
| vectorDb.name | string | `nil` |  |
| vectorDb.namespace | string | `nil` |  |
| vectorDb.owner | string | `nil` |  |
| vectorDb.password | string | `nil` |  |
| vectorDb.port | int | `5432` |  |
