# CNPG

Deploys a [CNPG](https://github.com/cloudnative-pg/cloudnative-pg) postgres cluster, with VectorChord extensions.

## Prerequisites

- [Cert-manager]()
- [Barman Cloud plugin](https://cloudnative-pg.io/plugin-barman-cloud/)
- Helm >= 3.10

## Configuration

## Install

```helm upgrade -i --create-namespace -n postgres postgres -f values.yaml ./```