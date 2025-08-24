# Monitoring

Deploys VMAgent, kube-state-metrics and configures some scrape configs.

Requires an external victoriametrics and grafana server.

## Prerequisites

- [VictoriaMetrics](https://github.com/VictoriaMetrics/VictoriaMetrics)
- [VictoriaMetrics operator](https://github.com/VictoriaMetrics/operator)
- Helm >= 3.10

## Configuration

### Values
|Parameter                  |Description                |Default  |Required|
|---                        |---                        |:---:    |:---:|
|config.remoteWriteUrl      |Server URL to VictoriaMetrics |
|config.scrapeInterval      | |10s


## Install

```helm upgrade -i --create-namespace -n monitoring monitoring -f values.yaml ./```