# Omnitools

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.5](https://img.shields.io/badge/AppVersion-0.5-informational?style=flat-square)

A Helm chart for OmniTools

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.image.repository | string | `"iib0011/omni-tools"` | App image |
| app.image.tag | string | `"0.6.0"` | Image version |
| app.name | string | `"omnitools"` |  |
| app.replicaCount | int | `1` | Number of pods |
| app.resources.limits.memory | string | `"1Gi"` |  |
| app.resources.requests.cpu | string | `"250m"` |  |
| app.resources.requests.memory | string | `"128Mi"` |  |
| ingress.baseUrl | string | `nil` | FQDN for the application |
| service.port | int | `80` | App port |
