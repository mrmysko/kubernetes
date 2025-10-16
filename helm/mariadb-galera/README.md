# mariadb-galera

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

A Helm chart for a MariaDB cluster

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backup.accessKey | string | `nil` | Username |
| backup.enabled | bool | `true` |  |
| backup.endpoint | string | `nil` | S3 endpoint url |
| backup.schedule | string | `"0 23 * * *"` | Backup cron schedule |
| backup.secretKey | string | `nil` | Password |
| galera.replicaCount | int | `3` | Number of replicating database pods |
| galera.rootPassword | string | `nil` | Root password |
| maxScale.enabled | bool | `true` |  |
| maxScale.metalLB.ip | string | `nil` | Loadbalancer IP |
