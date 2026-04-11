# Authelia

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.39.17](https://img.shields.io/badge/AppVersion-4.39.17-informational?style=flat-square)

A Helm chart for Authelia.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.1.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |
| file://../../library/mariadb | database(mariadb) | 0.1.0 |
| file://../../library/redis | redis | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1001` | Runtime group |
| app.image.repository | string | `"authelia/authelia"` | App image |
| app.image.tag | float | `4.39` | Image version |
| app.livenessProbe.httpGet.path | string | `"/api/health"` |  |
| app.livenessProbe.httpGet.port | int | `9091` |  |
| app.livenessProbe.httpGet.scheme | string | `"HTTPS"` |  |
| app.livenessProbe.initialDelaySeconds | int | `15` |  |
| app.livenessProbe.periodSeconds | int | `10` |  |
| app.name | string | `"authelia"` | App name |
| app.readinessProbe.httpGet.path | string | `"/api/health"` |  |
| app.readinessProbe.httpGet.port | int | `9091` |  |
| app.readinessProbe.httpGet.scheme | string | `"HTTPS"` |  |
| app.readinessProbe.initialDelaySeconds | int | `2` |  |
| app.readinessProbe.periodSeconds | int | `5` |  |
| app.replicaCount | int | `2` | Number of pods |
| app.resources.limits.memory | string | `"256Mi"` |  |
| app.resources.requests.cpu | string | `"500m"` |  |
| app.resources.requests.memory | string | `"128Mi"` |  |
| app.uid | int | `1001` | Runtime user |
| config.forwardAuth.address | string | `nil` |  |
| config.hmacSecret | string | `nil` |  |
| config.jwtSecret | string | `nil` |  |
| config.ldap.baseDN | string | `nil` | LDAP search root |
| config.ldap.groupFilter | string | `nil` | LDAP group filter |
| config.ldap.password | string | `nil` | LDAP password |
| config.ldap.searchUser | string | `nil` | LDAP user |
| config.ldap.url | string | `nil` | LDAP URL |
| config.ldap.userFilter | string | `nil` | LDAP user filter |
| config.notifier.smtp.address | string | `nil` |  |
| config.notifier.smtp.sender | string | `nil` |  |
| config.notifier.smtp.startupCheckAddress | string | `nil` |  |
| config.notifier.smtp.tls.serverName | string | `nil` |  |
| config.notifier.smtp.username | string | `nil` |  |
| config.oidcKey | string | `""` | PEM-formatted key |
| config.secretsDir | string | `"/secrets"` | Directory to mount secret files in |
| config.sessionSecret | string | `nil` |  |
| config.storageEncryptionKey | string | `nil` |  |
| config.traefik.namespace | string | `nil` |  |
| database.host | string | `nil` | FQDN to database |
| database.instanceName | string | `nil` | Database deployment name |
| database.name | string | `nil` | Database name |
| database.namespace | string | `nil` | Database namespace |
| database.password | string | `nil` | Database password |
| database.port | int | `3306` | Database port |
| database.type | string | `nil` | Kind of database |
| database.username | string | `nil` | Database username |
| ingress.baseUrl | string | `nil` | FQDN to application |
| redis.password | string | `nil` | Redis password |
| redis.port | int | `6379` | Redis port |
| redis.replicaCount | int | `1` | Number of redis pods |
| redis.username | string | `"default"` | Redis username |
| service.port | int | `9091` | App port |
