# cert-manager

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1](https://img.shields.io/badge/AppVersion-0.1-informational?style=flat-square)

A Helm chart for some Cert-Manager things

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| commonName | string | `nil` | Common name of certificate |
| dnsNames | list | `[]` | List of valid domains in certificate |
| secretName | string | `nil` | Secret name to place the certificate in |
