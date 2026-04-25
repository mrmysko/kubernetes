# This requires traefik crds - https://doc.traefik.io/traefik/getting-started/quick-start-with-kubernetes/
{{- define "baseResources.ingress" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}
{{- $fullname := include "baseResources.fullname" (dict "root" $root "vals" $vals) }}

apiVersion: traefik.io/v1alpha1
kind: IngressRoute
metadata:
  name: {{ printf "%s-route" $fullname }}
  labels:
    {{- include "common.labels" $root | nindent 4 }}
  {{- with $vals.ingress.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  entryPoints:
    - web
    - websecure
  routes:
    - kind: Rule
      match: Host(`{{ $vals.ingress.baseUrl }}`)
      services:
        - kind: Service
          name: {{ $vals.ingress.serviceOverride | default (printf "%s-svc" $fullname) }}
          port: {{ $vals.service.port }}
      {{- if $vals.ingress.forwardAuth }}
      middlewares:
        - name: authelia-forward-auth
          namespace: traefik
      {{- end }}
{{- end -}}