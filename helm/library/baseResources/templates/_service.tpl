{{- define "baseResources.service" -}}
{{- $root := .root }}
{{- $vals := .vals }}
{{- $fullname := include "baseResources.fullname" (dict "root" $root "vals" $vals) }}
{{- $serviceName := $vals.service.nameOverride | default (printf "%s-svc" $fullname) -}}

apiVersion: v1
kind: Service
metadata:
  name: {{ $serviceName }}
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