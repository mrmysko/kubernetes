# Authelia

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.39](https://img.shields.io/badge/AppVersion-4.39-informational?style=flat-square)

A Helm chart for Authelia. The database is handled by a clustered MariaDB deployment.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1001` | Runtime group |
| app.image.repository | string | `"authelia/authelia"` | App image |
| app.image.tag | float | `4.39` | Image version |
| app.name | string | `"authelia"` | App name |
| app.replicaCount | int | `2` | Number of pods |
| app.resources.limits.memory | string | `"256Mi"` |  |
| app.resources.requests.cpu | string | `"500m"` |  |
| app.resources.requests.memory | string | `"128Mi"` |  |
| app.uid | int | `1001` | Runtime user |
| config.hmacSecret | string | `nil` |  |
| config.jwtSecret | string | `nil` |  |
| config.ldap.baseDN | string | `nil` | LDAP search root |
| config.ldap.groupFilter | string | `nil` | LDAP group filter |
| config.ldap.password | string | `nil` | LDAP password |
| config.ldap.searchUser | string | `nil` | LDAP user |
| config.ldap.url | string | `nil` | LDAP URL |
| config.ldap.userFilter | string | `nil` | LDAP user filter |
| config.oidcKey | string | `""` | PEM-formatted key |
| config.secretsDir | string | `"/secrets"` | Directory to mount secret files in |
| config.sessionSecret | string | `nil` |  |
| config.storageEncryptionKey | string | `nil` |  |
| database.host | string | `nil` | FQDN to database |
| database.instanceName | string | `nil` | Database deployment name |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` | Database namespace |
| database.password | string | `nil` | Database password |
| database.port | int | `3306` | Database port |
| database.type | string | `nil` | Kind of database |
| database.username | string | `nil` | Database username |
| ingress.baseUrl | string | `nil` | FQDN to application |
| redis.image.pullPolicy | string | `nil` | Redis image pull policy |
| redis.password | string | `nil` | Redis password |
| redis.port | int | `6379` | Redis port |
| redis.replicaCount | int | `1` | Number of redis pods |
| redis.resources.limits.memory | string | `"256Mi"` |  |
| redis.resources.requests.cpu | string | `"250m"` |  |
| redis.resources.requests.memory | string | `"64Mi"` |  |
| redis.username | string | `"default"` | Redis username |
| service.port | int | `9091` | App port |
