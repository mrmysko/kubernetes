# Homepage

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.4](https://img.shields.io/badge/AppVersion-v1.4-informational?style=flat-square)

A Helm chart for Homepage

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.gid | int | `1001` | Runtime group |
| app.image.repository | string | `"ghcr.io/gethomepage/homepage"` | App image |
| app.image.tag | string | `"v1.4"` | Image version |
| app.name | string | `"homepage"` | App name |
| app.replicaCount | int | `1` | Number of pods |
| app.resources.limits.memory | string | `"512Mi"` |  |
| app.resources.requests.cpu | string | `"250m"` |  |
| app.resources.requests.memory | string | `"128Mi"` |  |
| app.uid | int | `1001` | Runtime user |
| config | string | `nil` |  |
| ingress.baseUrl | string | `nil` | FQDN for the application |
| service.port | int | `3000` | App port |
