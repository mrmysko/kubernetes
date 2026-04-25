{{- define "baseResources.service" -}}
{{- $root := .root }}
{{- $vals := .vals }}
{{- $fullname := include "baseResources.fullname" (dict "root" $root "vals" $vals) }}

apiVersion: v1
kind: Service
metadata:
  name: {{ printf "%s-svc" $fullname }}
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
    app.kubernetes.io/component: {{ $vals.component | quote }}
  {{- with .ports }}
  ports:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- end }}
{{- end }}