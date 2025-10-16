# postgres

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1](https://img.shields.io/badge/AppVersion-1-informational?style=flat-square)

A Helm chart for CNPG Postgres cluster, with VectorChord extensions.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backup.accessKey | string | `nil` |  |
| backup.enabled | bool | `true` |  |
| backup.endpointUrl | string | `nil` |  |
| backup.secretKey | string | `nil` |  |
| certificate.caBundleSecret | string | `nil` |  |
| certificate.domainName | string | `nil` |  |
| database.immich.password | string | `nil` |  |
| database.immich.username | string | `nil` |  |
| image.repository | string | `"ghcr.io/tensorchord/cloudnative-vectorchord"` |  |
| image.tag | string | `"17-0.5.2"` |  |
| replicaCount | int | `3` |  |
