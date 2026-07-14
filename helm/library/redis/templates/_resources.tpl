{{- define "redis.resources" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}

{{ include "redis.deployment" (dict "root" $root "vals" $vals) }}
---
{{ include "redis.service" (dict "root" $root "vals" $vals) }}
{{- end }}