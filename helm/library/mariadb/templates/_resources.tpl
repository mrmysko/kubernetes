{{- define "mariadb.resources" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}

{{ include "mariadb.database" (dict "root" $root "vals" $vals) }}
---
{{ include "mariadb.grant" (dict "root" $root "vals" $vals) }}
---
{{ include "mariadb.user" (dict "root" $root "vals" $vals) }}
{{- end }}