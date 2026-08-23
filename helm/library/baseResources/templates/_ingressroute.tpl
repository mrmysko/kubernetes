# This requires traefik crds - https://doc.traefik.io/traefik/getting-started/quick-start-with-kubernetes/
{{- define "baseResources.ingress" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}
{{- $fullname := include "baseResources.fullname" $root }}

apiVersion: traefik.io/v1alpha1
kind: IngressRoute
metadata:
  name: {{ printf "%s-route" $fullname | quote }}
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
      match: {{ printf "Host(`%s`)" $vals.ingress.baseUrl | quote }}
      services:
        - kind: Service
          name: {{ $vals.ingress.serviceOverride | default (printf "%s-svc" $fullname) | quote }}
          port: {{ $vals.ingress.port }}
          {{- with $vals.ingress.scheme }}
          scheme: {{ . | quote }}
          {{- end }}
          {{- with $vals.ingress.serversTransport }}
          serversTransport: {{ . | quote }}
          {{- end }}
          {{- if $vals.ingress.sticky }}
          sticky:
            cookie: {}
          {{- end }}
      {{- if $vals.ingress.forwardAuth }}
      middlewares:
        - name: authelia-forward-auth
          namespace: traefik
      {{- end }}
{{- end -}}