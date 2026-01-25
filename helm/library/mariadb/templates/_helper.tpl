{{- define "mariadb.fullname" -}}
{{ printf "%s-%s-%s" .Release.Name .Chart.Name .Values.name | lower | trunc 63 | trimSuffix "-" }}
{{- end }}