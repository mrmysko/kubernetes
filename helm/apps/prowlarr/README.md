# Radarr

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A WIP Helm chart for Prowlarr

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.8.0 |
| file://../../library/cnpg | cnpg | 0.3.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| mainDb.clusterName | string | `nil` |  |
| mainDb.host | string | `nil` | Fully qualified domain name (FQDN) to the database |
| mainDb.name | string | `nil` | Name of the database |
| mainDb.namespace | string | `nil` | Kubernetes namespace where the database is deployed |
| mainDb.owner | string | `nil` | Username used to connect to the database |
| mainDb.password | string | `nil` | Password used to connect to the database |
| mainDb.port | string | `nil` | Port used to connect to the database |
