{{- define "baseResources.authDelegate" -}}
{{- $root := .root -}}
{{- $fullname := include "baseResources.fullname" $root }}

apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: {{ printf "%s-auth-proxy" $root.Release.Name | quote }}
  namespace: {{ $root.Release.Namespace | quote }}
spec:
  chain:
    middlewares:
      - name: authelia-forward-auth
        namespace: traefik
{{- end -}}