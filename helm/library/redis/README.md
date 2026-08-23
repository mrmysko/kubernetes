# redis

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

Reusable Redis cache component

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../baseResources | baseResources | 0.6.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| livenessProbe.exec.command[0] | string | `"redis-cli"` |  |
| livenessProbe.exec.command[1] | string | `"-a"` |  |
| livenessProbe.exec.command[2] | string | `"$(REDIS_PASSWORD)"` |  |
| livenessProbe.exec.command[3] | string | `"ping"` |  |
| livenessProbe.initialDelaySeconds | int | `10` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| port | int | `6379` |  |
| readinessProbe.exec.command[0] | string | `"redis-cli"` |  |
| readinessProbe.exec.command[1] | string | `"-a"` |  |
| readinessProbe.exec.command[2] | string | `"$(REDIS_PASSWORD)"` |  |
| readinessProbe.exec.command[3] | string | `"ping"` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `2` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"250m"` |  |
| resources.requests.memory | string | `"64Mi"` |  |
