# Navidrome

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.58.0](https://img.shields.io/badge/AppVersion-0.58.0-informational?style=flat-square)

A Helm chart for Navidrome

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1001` | Runtime group |
| app.image.repository | string | `"ghcr.io/navidrome/navidrome"` | App image |
| app.image.tag | string | `"0.58.0"` | Image version |
| app.livenessProbe.httpGet.path | string | `"/ping"` |  |
| app.livenessProbe.httpGet.port | int | `4533` |  |
| app.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| app.livenessProbe.initialDelaySeconds | int | `10` |  |
| app.livenessProbe.periodSeconds | int | `10` |  |
| app.name | string | `"navidrome"` | App name |
| app.readinessProbe.httpGet.path | string | `"/ping"` |  |
| app.readinessProbe.httpGet.port | int | `4533` |  |
| app.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| app.readinessProbe.initialDelaySeconds | int | `10` |  |
| app.readinessProbe.periodSeconds | int | `10` |  |
| app.replicaCount | int | `1` | Number of pods |
| app.resources.limits.memory | string | `"512Mi"` |  |
| app.resources.requests.cpu | string | `"500m"` |  |
| app.resources.requests.memory | string | `"256Mi"` |  |
| app.uid | int | `1001` | Runtime user |
| config.lastFM.apiKey | string | `nil` |  |
| config.lastFM.apiSecret | string | `nil` |  |
| config.reverseProxyWhitelist | string | `nil` | Allowed proxy IPs |
| ingress.baseUrl | string | `nil` | FQDN for the application |
| middleware.whitelist.ip | string | `nil` |  |
| service.port | int | `4533` | App port |
| storage.existingPvcName | string | `nil` |  |
| storage.smb.password | string | `nil` | Samba password |
| storage.smb.share | string | `nil` |  |
| storage.smb.url | string | `nil` |  |
| storage.smb.username | string | `nil` | Samba username |
