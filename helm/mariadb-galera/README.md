# MariaDB Galera

Deploys a MariaDB Galera cluster.

Backups are taken nightly to S3 storage.

## Prerequisites

- [Local Path Provisioner](https://github.com/rancher/local-path-provisioner)
- [MariaDB operator](https://github.com/mariadb-operator/mariadb-operator)
- Helm >= 3.10

## Configuration

## Install

```helm upgrade -i --create-namespace -n mariadb-galera mariadb-galera -f values.yaml ./```