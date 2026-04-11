# BIND

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 9.20](https://img.shields.io/badge/AppVersion-9.20-informational?style=flat-square)

A Helm chart for recursive BIND-servers.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/baseResources | baseResources | 0.1.0 |
| file://../../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| acls.example_net[0] | string | `"100.100.100.0/24"` |  |
| acls.this_server[0] | string | `"127.0.0.1/32"` |  |
| app.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| app.image.repository | string | `"internetsystemsconsortium/bind9"` | App image |
| app.image.tag | string | `nil` | App version |
| app.livenessProbe.exec.command[0] | string | `"/bin/sh"` |  |
| app.livenessProbe.exec.command[1] | string | `"-c"` |  |
| app.livenessProbe.exec.command[2] | string | `"dig @127.0.0.1 . NS +norecurse > /dev/null || exit 1"` |  |
| app.livenessProbe.initialDelaySeconds | int | `15` |  |
| app.livenessProbe.periodSeconds | int | `10` |  |
| app.livenessProbe.timeoutSeconds | int | `3` |  |
| app.name | string | `"bind"` | App name |
| app.readinessProbe.exec.command[0] | string | `"/bin/sh"` |  |
| app.readinessProbe.exec.command[1] | string | `"-c"` |  |
| app.readinessProbe.exec.command[2] | string | `"dig @127.0.0.1 . NS +norecurse > /dev/null || exit 1"` |  |
| app.readinessProbe.initialDelaySeconds | int | `2` |  |
| app.readinessProbe.periodSeconds | int | `5` |  |
| app.replicaCount | int | `2` | Number of pods |
| zones.forwarders[0] | string | `"100.100.100.100"` |  |
| zones.forwarders[1] | string | `"100.100.100.101"` |  |
| zones.zones[0] | string | `"example.com"` |  |
| zones.zones[1] | string | `"100.100.100.in-addr.arpa"` |  |
