{{- define "baseResources.authDelegate" -}}
{{- $root := .root -}}
{{- $vals := .vals -}}
{{- $fullname := include "baseResources.fullname" $root }}

{{- range $rule := $vals.rules }}
{{- if $rule.forwardAuth }}
apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: {{ printf "%s-%s-proxy" $root.Release.Name $rule.name | quote }}
  namespace: {{ $root.Release.Namespace | quote }}
spec:
  chain:
    middlewares:
      # This is for traefik to rewrite authelias 401 to 302, so it automatically redirects
      {{- if $rule.statusRewrite }}
      - name: authelia-status-rewrite
        namespace: traefik
      {{- end }}
      - name: authelia-forward-auth
        namespace: traefik
---
{{- end -}}
{{- end -}}
{{- end -}}