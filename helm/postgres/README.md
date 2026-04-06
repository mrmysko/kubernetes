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
| backup.accessKey | string | `nil` |  |
| backup.enabled | bool | `true` |  |
| backup.endpointUrl | string | `nil` |  |
| backup.secretKey | string | `nil` |  |
| certificate.caBundleSecret | string | `nil` |  |
| certificate.domainName | string | `nil` |  |
| database.users[0].comment | string | `"Immich"` |  |
| database.users[0].name | string | `"immich-user"` |  |
| database.users[1].comment | string | `"Miniflux"` |  |
| database.users[1].name | string | `"miniflux-user"` |  |
| database.users[2].comment | string | `"Open WebUI"` |  |
| database.users[2].name | string | `"openwebui-user"` |  |
| database.users[3].comment | string | `"Open WebUI Vector"` |  |
| database.users[3].name | string | `"openwebui-vector-user"` |  |
| image.repository | string | `"ghcr.io/tensorchord/cloudnative-vectorchord"` |  |
| image.tag | string | `"17-0.5.2"` |  |
| replicaCount | int | `3` |  |
