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
spec:
  type: {{ $vals.service.type | default "ClusterIP" }}
  selector:
    app.kubernetes.io/instance: {{ $root.Release.Name | quote }}
    app.kubernetes.io/component: {{ $vals.component | quote }}
  ports:
    - port: {{ $vals.service.port }}
      targetPort: {{ $vals.service.port }}
{{- end }}