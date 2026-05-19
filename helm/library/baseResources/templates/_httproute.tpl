{{- define "baseResources.httproute" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}
{{- $fullname := include "baseResources.fullname" (dict "root" $root "vals" $vals) }}
{{- $routeName := $vals.nameOverride | default (printf "%s-https" $fullname) }}

{{- $needsAuth := false }}
{{- range $vals.rules }}
  {{- if .forwardAuth }}{{ $needsAuth = true }}{{ end }}
{{- end }}

{{- if $needsAuth }}
{{ include "baseResources.authDelegate" (dict "root" $root "vals" $vals) }}
---
{{- end }}

apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: {{ $routeName }}
  namespace: {{ $root.Release.Namespace }}
  labels:
    {{- include "common.labels" $root | nindent 4 }}
spec:
  parentRefs:
    - name: traefik-gateway
      namespace: traefik
      sectionName: websecure
  hostnames:
    - {{ $vals.baseUrl | quote }}
  rules:
    {{- range $rule := $vals.rules }}
    - matches:
        - path:
            type: PathPrefix
            value: {{ $rule.path | default "/" | quote }}
      {{- if or $rule.forwardAuth $rule.middlewares }}
      filters:
        {{- if $rule.forwardAuth }}
        - type: ExtensionRef
          extensionRef:
            group: traefik.io
            kind: Middleware
            name: {{ printf "%s-auth-proxy" $root.Release.Name }}
        {{- end }}
        {{- range $rule.middlewares }}
        - type: ExtensionRef
          extensionRef:
            group: traefik.io
            kind: Middleware
            name: {{ .name }}
        {{- end }}
      {{- end }}
      backendRefs:
        - name: {{ $vals.serviceOverride | default (printf "%s-svc" $fullname) }}
          port: {{ $vals.port }}
    {{- end }}
{{- end -}}