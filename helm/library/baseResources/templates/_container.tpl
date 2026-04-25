{{- define "baseResources.baseContainer" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}
{{- $fullname := include "baseResources.fullname" (dict "root" $root "vals" $vals) }}

name: {{ $fullname }}
image: "{{ $vals.image.repository }}:{{ $vals.image.tag | default $root.Chart.AppVersion }}"
imagePullPolicy: {{ $vals.image.pullPolicy | default "IfNotPresent" }}
{{- end }}