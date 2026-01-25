# This requires traefik crds - https://doc.traefik.io/traefik/getting-started/quick-start-with-kubernetes/
{{- define "default-svc.ingress" -}}
apiVersion: traefik.io/v1alpha1
kind: IngressRoute
metadata:
  name: {{ print .Release.Name "-route" | quote }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
  {{- with .Values.ingress.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  entryPoints:
    - web
    - websecure
  routes:
    - kind: Rule
      match: Host(`{{ .Values.ingress.baseUrl }}`)
      services:
        - kind: Service
          name: {{ print .Release.Name "-svc" | quote }}
          port: {{ .Values.service.port }}
{{- end -}}