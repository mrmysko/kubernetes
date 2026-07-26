# reverse-proxy

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1](https://img.shields.io/badge/AppVersion-0.1-informational?style=flat-square)

Basic helm template for proxying external services

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| domain | string | `nil` |  |
| external.url | string | `nil` |  |
| services.service1.external.ip | string | `nil` |  |
| services.service1.middleware.auth | string | `nil` |  |
| services.service1.port | string | `nil` |  |
| services.service1.scheme | string | `nil` |  |
| services.service2.external.ip | string | `nil` |  |
| services.service2.middleware.auth | string | `nil` |  |
| services.service2.port | string | `nil` |  |
| services.service2.scheme | string | `nil` |  |
