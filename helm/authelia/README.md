# Authelia

Deploys [Authelia](https://github.com/authelia/authelia).

## Prerequisites

- [MariaDB operator](https://github.com/mariadb-operator/mariadb-operator)
- [Traefik](https://doc.traefik.io/traefik/setup/kubernetes/)
- Helm >= 3.10

## Configuration

### Values
|Parameter                  |Description                |Default  |Required|
|---                        |---                        |:---:    |:---:|
|service.port               |Service port               |8080
|ingress.baseUrl            |Traefik ingress URL        |
|config.secretsDir          | |/secrets
|config.ldap.url            |
|config.ldap.searchUser     |
|config.ldap.baseDN         |
|config.ldap.userFilter     |
|config.ldap.groupFilter    |


### Creating the secret
Place in the templates directory.

```
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Release.Name }}-secret
  labels:
    {{- include "common.labels" . | nindent 4 }}
type: Opaque
stringData:
```

## Install

helm upgrade -i --create-namespace -n authelia authelia -f values.yaml ./