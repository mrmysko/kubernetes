# MariaDB Galera

Deploys a MariaDB Galera cluster.

Backups are taken nightly to S3 storage.

## Prerequisites

- [Local Path Provisioner](https://github.com/rancher/local-path-provisioner)
- [MariaDB operator](https://github.com/mariadb-operator/mariadb-operator)
- Helm >= 3.10

## Configuration


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

```helm upgrade -i --create-namespace -n mariadb-galera mariadb-galera -f values.yaml ./```