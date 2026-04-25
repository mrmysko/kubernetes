{{- define "baseResources.fullname" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}

{{- printf "%s-%s" $vals.name $root.Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}