# postgres

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1](https://img.shields.io/badge/AppVersion-1-informational?style=flat-square)

A Helm chart for CNPG Postgres cluster, with VectorChord extensions.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.name | string | `"postgres-cluster"` | Name of the application |
| backup.accessKey | string | `nil` |  |
| backup.enabled | bool | `true` |  |
| backup.endpointUrl | string | `nil` |  |
| backup.secretKey | string | `nil` |  |
| certificate.caBundleSecret | string | `"invis-external-bundle"` |  |
| certificate.domainName | string | `nil` |  |
| image.repository | string | `"ghcr.io/tensorchord/cloudnative-vectorchord"` | Docker image repository for the application |
| image.tag | string | `"17.10-1.1.1"` | Docker image tag (can be left empty to use the latest version) |
| pooler.lb.ip | string | `nil` |  |
| replicaCount | int | `3` |  |
