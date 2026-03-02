# Technitium

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 13.6.0](https://img.shields.io/badge/AppVersion-13.6.0-informational?style=flat-square)

A Helm chart for Technitium

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1001` | Runtime group |
| app.image.pullPolicy | string | `"Always"` | Image pull policy |
| app.image.repository | string | `"technitium/dns-server"` | App image |
| app.image.tag | string | `"latest"` | App version |
| app.livenessProbe.exec.command[0] | string | `"sh"` |  |
| app.livenessProbe.exec.command[1] | string | `"-c"` |  |
| app.livenessProbe.exec.command[2] | string | `"dig +short +retry=0 +norecurse @127.0.0.1 localhost | grep 127.0.0.1"` |  |
| app.livenessProbe.initialDelaySeconds | int | `5` |  |
| app.livenessProbe.periodSeconds | int | `20` |  |
| app.name | string | `"technitium"` | App name |
| app.readinessProbe.exec.command[0] | string | `"sh"` |  |
| app.readinessProbe.exec.command[1] | string | `"-c"` |  |
| app.readinessProbe.exec.command[2] | string | `"dig +short +retry=0 +norecurse @127.0.0.1 localhost | grep 127.0.0.1"` |  |
| app.readinessProbe.initialDelaySeconds | int | `5` |  |
| app.readinessProbe.periodSeconds | int | `10` |  |
| app.replicaCount | int | `1` | Number of pods |
| app.resources.limits.memory | string | `"512Mi"` |  |
| app.resources.requests.cpu | string | `"250m"` |  |
| app.resources.requests.memory | string | `"256Mi"` |  |
| app.uid | int | `1001` | Runtime user |
| config.dnsServerAdminPassword | string | `nil` | Admin password |
| config.dnsServerDomain | string | `nil` | Root domain |
| ingress.baseUrl | string | `nil` | FQDN for application |
| service.port | int | `5380` | App port |
