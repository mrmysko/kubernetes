{{- define "mariadb.fullname" -}}
{{- .Release.Name -}}
{{- end -}}

{{- define "maxscale.fullname" -}}
{{- printf "maxscale-%s" .Release.Name -}}
{{- end -}}