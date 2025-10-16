{{/*
Universal label helper — can be copied into any chart
*/}}

{{- define "common.labels" -}}
app.kubernetes.io/name: {{ .Values.app.name | default .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.Version }}
{{- end }}