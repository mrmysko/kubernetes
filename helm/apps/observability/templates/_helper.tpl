{{- define "app.fullname" -}}
{{- printf "%s-%s" .Release.Name (.Values.app.name | default .Chart.Name) | trunc 63 | trimSuffix "-" -}}
{{- end }}