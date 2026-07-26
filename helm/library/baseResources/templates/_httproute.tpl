{{- define "baseResources.httproute" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values.app }}

{{- $route := $vals.route }}

{{- $fullname := include "baseResources.fullname" $root }}
{{- $routeName := $route.nameOverride | default (printf "%s-https" $fullname) }}

{{- $needsAuth := false }}
{{- range $route.rules }}
  {{- if .forwardAuth }}{{ $needsAuth = true }}{{ end }}
{{- end }}

{{- if $needsAuth }}
{{ include "baseResources.authDelegate" (dict "root" $root "vals" $route) }}
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
    - {{ $route.baseUrl | quote }}
  rules:
    {{- range $rule := $route.rules }}
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
        - name: {{ include "baseResources.serviceName" (dict "root" $root "vals" $vals) }}
          port: {{ $route.port }}
    {{- end }}
{{- end -}}