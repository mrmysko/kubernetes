# Radarr

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6](https://img.shields.io/badge/AppVersion-6-informational?style=flat-square)

A WIP Helm chart for Radarr

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.1.0 |
| file://../../library/cnpg-database | mainDb(cnpg-database) | 0.1.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| mainDb.clusterName | string | `nil` |  |
| mainDb.host | string | `nil` |  |
| mainDb.name | string | `nil` |  |
| mainDb.namespace | string | `nil` |  |
| mainDb.owner | string | `nil` |  |
| mainDb.password | string | `nil` |  |
| mainDb.port | string | `nil` |  |
