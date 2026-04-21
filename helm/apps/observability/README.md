# VictoriaMetrics

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.131.0-cluster](https://img.shields.io/badge/AppVersion-v1.131.0--cluster-informational?style=flat-square)

VictoriaMetrics cluster and some scrape configs, relies on the victoriametrics operator.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../library/common-labels | common-labels | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| agent.remoteWriteUrl | string | `nil` |  |
| app.image.tag | string | `nil` |  |
| app.name | string | `"victoriametrics"` |  |
| graphite.metallb.ip | string | `nil` |  |
| ingress.baseUrl | string | `nil` |  |
