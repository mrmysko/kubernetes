# Glance

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.8.4](https://img.shields.io/badge/AppVersion-v0.8.4-informational?style=flat-square)

A Helm chart for Glance

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1001` | Runtime group |
| app.image.pullPolicy | string | `"Always"` | Image pull policy |
| app.image.repository | string | `"glanceapp/glance"` | App image |
| app.image.tag | string | `"latest"` | Image version |
| app.name | string | `"glance"` | App name |
| app.replicaCount | int | `1` | Number of pods |
| app.resources.limits.memory | string | `"256Mi"` |  |
| app.resources.requests.cpu | string | `"250m"` |  |
| app.resources.requests.memory | string | `"64Mi"` |  |
| app.uid | int | `1001` | Runtime user |
| ingress.baseUrl | string | `nil` |  |
| service.port | int | `8080` | App port |
