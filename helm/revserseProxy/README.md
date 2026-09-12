# reverse-proxy

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1](https://img.shields.io/badge/AppVersion-0.1-informational?style=flat-square)

Helm template for proxying external services through Traefik

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| domain | string | `nil` | Base domain used for the services |
| external.url | string | `nil` | External URL used to access the services |
| services.service1.external.ip | string | `nil` | External IP address of the service |
| services.service1.middleware.auth | string | `nil` | Enable authentication middleware for the service |
| services.service1.port | string | `nil` | Port the service listens on |
| services.service1.scheme | string | `nil` | Protocol/scheme used to access the service (e.g. http, https) |
| services.service2.external.ip | string | `nil` |  |
| services.service2.middleware.auth | string | `nil` |  |
| services.service2.port | string | `nil` |  |
| services.service2.scheme | string | `nil` |  |
