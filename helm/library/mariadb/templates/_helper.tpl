{{- define "mariadb.fullname" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}
{{- $basename := include "baseResources.fullname" (dict "root" $root) }}
{{- printf "%s-%s" $basename $vals.name | lower | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "mariadb.databaseName" -}}
{{- printf "%s-db" (include "mariadb.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "mariadb.userName" -}}
{{- printf "%s-db-user" (include "mariadb.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "mariadb.grantName" -}}
{{- printf "%s-db-grant" (include "mariadb.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}