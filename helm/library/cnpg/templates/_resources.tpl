{{- define "cnpg.resources" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}

{{ include "cnpg.database" (dict "root" $root "vals" $vals) }}
---
{{ include "cnpg.role" (dict "root" $root "vals" $vals) }}
{{- end }}