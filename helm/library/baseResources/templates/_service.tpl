{{- define "baseResources.service" -}}
{{- $root := .root }}
{{- $vals := .vals }}

apiVersion: v1
kind: Service
metadata:
  name: {{ include "baseResources.serviceName" (dict "root" $root "vals" $vals) }}
  labels:
    {{- include "common.labels" $root | nindent 4 }}
    {{- with $vals.service.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
spec:
  {{- with $vals.service }}
  type: {{ .type | default "ClusterIP" }}
  {{- if eq .type "LoadBalancer" }}
  loadBalancerIP: {{ .loadBalancerIP }}
  {{- end }}
  {{- with .externalTrafficPolicy }}
  externalTrafficPolicy: {{ . }}
  {{- end }}
  selector:
    app.kubernetes.io/instance: {{ $root.Release.Name | quote }}
    {{- if $vals.component }}
    app.kubernetes.io/component: {{ $vals.component | quote }}
    {{- end }}
  {{- with .ports }}
  ports:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- end }}
{{- end }}