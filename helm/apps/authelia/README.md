# Authelia

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Authelia.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.8.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |
| file://../../library/mariadb | database(mariadb) | 0.3.0 |
| file://../../library/redis | redis | 0.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.component | string | `"frontend"` | Component of the application being configured (e.g., frontend, backend) |
| app.image.gid | int | `1001` | Group ID for the container |
| app.image.repository | string | `"authelia/authelia"` | Docker image repository for the application |
| app.image.tag | string | `"4.39.25"` | Docker image tag (can be left empty to use the latest version) |
| app.image.uid | int | `1001` | User ID for the container |
| app.livenessProbe.httpGet.path | string | `"/api/health"` | Path to the health check endpoint |
| app.livenessProbe.httpGet.port | int | `9091` | Port used for the liveness probe |
| app.livenessProbe.httpGet.scheme | string | `"HTTPS"` | Protocol used for the liveness probe |
| app.livenessProbe.initialDelaySeconds | int | `15` | Delay before starting the liveness probe |
| app.livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| app.name | string | `"authelia"` | Name of the application |
| app.readinessProbe.httpGet.path | string | `"/api/health"` | Path to the health check endpoint |
| app.readinessProbe.httpGet.port | int | `9091` | Port used for the readiness probe |
| app.readinessProbe.httpGet.scheme | string | `"HTTPS"` | Protocol used for the readiness probe |
| app.readinessProbe.initialDelaySeconds | int | `2` | Delay before starting the readiness probe |
| app.readinessProbe.periodSeconds | int | `5` | Frequency of the readiness probe |
| app.replicaCount | int | `2` | Number of replicas to deploy for the application |
| app.resources.limits.memory | string | `"512Mi"` | Maximum memory resources allowed for the container |
| app.resources.requests.cpu | string | `"250m"` | Minimum CPU resources required by the container |
| app.resources.requests.memory | string | `"128Mi"` | Minimum memory resources required by the container |
| app.route.baseUrl | string | `nil` | Base URL for the service |
| app.route.port | int | `9091` | Port used for the route |
| app.route.rules[0].path | string | `"/"` |  |
| app.route.rules[0].sticky | bool | `true` | Enable sticky sessions for this route |
| app.service.ports[0].name | string | `"https"` |  |
| app.service.ports[0].port | int | `9091` | Port exposed by the service |
| app.service.ports[0].protocol | string | `"TCP"` | Protocol used for the service |
| app.service.ports[0].targetPort | int | `9091` | Port the container is listening on |
| config.hmacSecret | string | `nil` | Secret used for HMAC (Hash-based Message Authentication Code) signing |
| config.jwtSecret | string | `nil` | Secret used for JWT (JSON Web Token) signing |
| config.ntp.address | string | `nil` | Address of the NTP server |
| config.oidcKey | string | `nil` |  |
| config.secretsDir.secretsDir | string | `"/secrets"` | Directory where secrets are stored |
| config.sessionSecret | string | `nil` | Secret used for session signing |
| config.storageEncryptionKey | string | `nil` | Key used for encrypting storage |
| database.host | string | `nil` | Fully qualified domain name (FQDN) to the database |
| database.instanceName | string | `nil` | Name of the database instance |
| database.name | string | `nil` | Name of the database |
| database.namespace | string | `nil` | Kubernetes namespace where the database is deployed |
| database.password | string | `nil` | Password used to connect to the database |
| database.passwordKey | string | `"MYSQL_PASSWORD"` | Key used to reference the password in a secret |
| database.port | int | `3306` | Port used to connect to the database |
| database.type | string | `"mariadb"` | Type of database (e.g., mariadb, postgresql) |
| database.username | string | `nil` | Username used to connect to the database |
| ldap.address | string | `nil` | LDAP server address |
| ldap.baseDN | string | `nil` | Base DN for LDAP searches |
| ldap.groupFilter | string | `nil` | Group filter used for LDAP authentication |
| ldap.password | string | `nil` | Password used to connect to the LDAP server |
| ldap.userDN | string | `nil` | User DN used for LDAP authentication |
| ldap.userFilter | string | `nil` | User filter used for LDAP authentication |
| network.home_subnet | list | `["10.10.10.10"]` | Home subnet range |
| network.servers_subnet | list | `["10.10.10.10"]` | Servers subnet range |
| network.vpn_clients | list | `["255.255.255.255"]` | VPN client IP addresses |
| notifier.smtp.address | string | `"submissions://10.40.40.6:465"` | SMTP server address |
| notifier.smtp.sender | string | `nil` | Email address used to send notifications |
| notifier.smtp.startupCheckAddress | string | `"test@"` | Email address used for startup checks |
| notifier.smtp.tls.serverName | string | `nil` | Server name used for TLS verification |
| notifier.smtp.username | string | `nil` | Username used to connect to the SMTP server |
| redis.password | string | `nil` | Password used to connect to Redis |
| redis.port | int | `6379` | Port used to connect to Redis |
| redis.replicaCount | int | `1` | Number of Redis replicas |
| redis.username | string | `"default"` | Username used to connect to Redis |
| session.cookies[0].authelia_url | string | `nil` | Authelia URL for cookie domain |
| session.cookies[0].default_redirection_url | string | `nil` | Default redirection URL for cookies |
| session.cookies[0].domain | string | `nil` |  |
