{{- define "baseResources.baseContainer" -}}
name: {{ .Values.app.name | default .Release.Name | quote }}
image: "{{ .Values.app.image.repository }}:{{ .Values.app.image.tag | default .Chart.AppVersion }}"
imagePullPolicy: {{ .Values.app.image.pullPolicy | default "IfNotPresent" }}
{{- end }}