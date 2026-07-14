{{- define "cnpg.fullname" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}
{{- $basename := include "baseResources.fullname" (dict "root" $root) }}
{{- printf "%s-%s" $basename $vals.name | lower | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "cnpg.databaseName" -}}
{{- printf "%s-db" (include "cnpg.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "cnpg.roleName" -}}
{{- printf "%s-role" (include "cnpg.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}