{{/*
Universal labels
*/}}

{{- define "common.labels" -}}
app.kubernetes.io/name: {{ (and .Values.app .Values.app.name) | default .Chart.Name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}