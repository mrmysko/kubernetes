# BIND

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for recursive BIND-servers.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.8.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| acls.home_net | list | `[]` |  |
| acls.k8s_pods | list | `[]` |  |
| acls.this_server | list | `[]` |  |
| acls.vpn | list | `[]` |  |
| bind.component | string | `"dns"` | Component of the application being configured (e.g., frontend, backend) |
| bind.gid | int | `53` | Group ID for the container |
| bind.image.pullPolicy | string | `"IfNotPresent"` |  |
| bind.image.repository | string | `"internetsystemsconsortium/bind9"` | Docker image repository for the application |
| bind.image.tag | float | `9.2` | Docker image tag (can be left empty to use the latest version) |
| bind.livenessProbe.exec.command[0] | string | `"/bin/sh"` |  |
| bind.livenessProbe.exec.command[1] | string | `"-c"` |  |
| bind.livenessProbe.exec.command[2] | string | `"dig @127.0.0.1 . NS +norecurse > /dev/null || exit 1"` |  |
| bind.livenessProbe.initialDelaySeconds | int | `15` | Delay before starting the liveness probe |
| bind.livenessProbe.periodSeconds | int | `10` | Frequency of the liveness probe |
| bind.livenessProbe.timeoutSeconds | int | `3` |  |
| bind.name | string | `"bind"` | Name of the application |
| bind.readinessProbe.exec.command[0] | string | `"/bin/sh"` |  |
| bind.readinessProbe.exec.command[1] | string | `"-c"` |  |
| bind.readinessProbe.exec.command[2] | string | `"dig @127.0.0.1 . NS +norecurse > /dev/null || exit 1"` |  |
| bind.readinessProbe.initialDelaySeconds | int | `2` | Delay before starting the readiness probe |
| bind.readinessProbe.periodSeconds | int | `5` | Frequency of the readiness probe |
| bind.replicaCount | int | `2` | Number of replicas to deploy for the application |
| bind.service.externalTrafficPolicy | string | `"Cluster"` |  |
| bind.service.labels."cilium.lb" | string | `"true"` |  |
| bind.service.loadBalancerIP | string | `nil` |  |
| bind.service.ports[0].name | string | `"dns-tcp"` |  |
| bind.service.ports[0].port | int | `53` | Port exposed by the service |
| bind.service.ports[0].protocol | string | `"TCP"` | Protocol used for the service |
| bind.service.ports[0].targetPort | int | `53` | Port the container is listening on |
| bind.service.ports[1].name | string | `"dns-udp"` |  |
| bind.service.ports[1].port | int | `53` | Port exposed by the service |
| bind.service.ports[1].protocol | string | `"UDP"` | Protocol used for the service |
| bind.service.ports[1].targetPort | int | `53` | Port the container is listening on |
| bind.service.type | string | `"LoadBalancer"` |  |
| bind.uid | int | `53` |  |
| zones.forwarders[0] | string | `"10.40.40.3"` |  |
| zones.zones | list | `[]` |  |
