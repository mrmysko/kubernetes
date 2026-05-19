{{- define "baseResources.authDelegate" -}}
{{- $root := .root -}}
{{- $fullname := include "baseResources.fullname" (dict "root" $root) -}}
apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: {{ printf "%s-auth-proxy" $root.Release.Name }}
  namespace: {{ $root.Release.Namespace }}
spec:
  chain:
    middlewares:
      - name: authelia-forward-auth
        namespace: traefik
{{- end -}}