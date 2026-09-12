# redis

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

Reusable Redis instance

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../baseResources | baseResources | 0.8.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| livenessProbe.exec.command[0] | string | `"redis-cli"` |  |
| livenessProbe.exec.command[1] | string | `"-a"` |  |
| livenessProbe.exec.command[2] | string | `"$(REDIS_PASSWORD)"` |  |
| livenessProbe.exec.command[3] | string | `"ping"` |  |
| livenessProbe.initialDelaySeconds | int | `10` | Delay before starting the liveness probe |
| livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| port | int | `6379` | Port exposed by the service |
| readinessProbe.exec.command[0] | string | `"redis-cli"` |  |
| readinessProbe.exec.command[1] | string | `"-a"` |  |
| readinessProbe.exec.command[2] | string | `"$(REDIS_PASSWORD)"` |  |
| readinessProbe.exec.command[3] | string | `"ping"` |  |
| readinessProbe.initialDelaySeconds | int | `5` | Delay before starting the readiness probe |
| readinessProbe.periodSeconds | int | `2` | Frequency of the readiness probe |
| replicaCount | int | `1` | Number of replicas to deploy for the application |
| resources.limits.memory | string | `"256Mi"` | Maximum memory resources allowed for the container |
| resources.requests.cpu | string | `"250m"` | Minimum CPU resources required by the container |
| resources.requests.memory | string | `"64Mi"` | Minimum memory resources required by the container |
