{{/*
Redis resource name, derived from baseResources.fullname.
*/}}
{{- define "redis.fullname" -}}
{{- $root := .root | default . }}
{{- $basename := include "baseResources.fullname" (dict "root" $root) }}
{{- printf "%s-redis" $basename | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Redis Service name.
*/}}
{{- define "redis.serviceName" -}}
{{- printf "%s-svc" (include "redis.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Redis FQDN.
*/}}
{{- define "redis.serviceFQDN" -}}
{{- $root := .root | default . }}
{{- printf "%s.%s.svc" (include "redis.serviceName" (dict "root" $root)) $root.Release.Namespace }}
{{- end -}}