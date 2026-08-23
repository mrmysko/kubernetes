{{- define "baseResources.baseContainer" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}
{{- $fullname := include "baseResources.fullname" $root }}

- name: {{ $fullname | quote }}
  image: {{ printf "%s:%s" $vals.image.repository ($vals.image.tag | default $root.Chart.AppVersion) | quote }}
  imagePullPolicy: {{ $vals.image.pullPolicy | default "IfNotPresent" | quote }}

  {{- with $vals.service }}
    {{- with .ports}}
  ports:
    {{- range . }}
    - name: {{ .name | quote }}
      containerPort: {{ .targetPort }}
      protocol: {{ .protocol | default "TCP" }}
    {{- end }}
    {{- end }}
  {{- end }}

  {{- with $vals.resources }}
  resources:
    {{- toYaml . | nindent 4 }}
  {{- end }}

  {{- with $vals.livenessProbe }}
  livenessProbe:
    {{- toYaml . | nindent 4 }}
  {{- end }}

  {{- with $vals.readinessProbe }}
  readinessProbe:
    {{- toYaml . | nindent 4 }}
  {{- end }}

  {{- if $vals.securityContext }}
  securityContext:
    {{- toYaml $vals.securityContext | nindent 4 }}
  {{- else }}
  securityContext:
    runAsUser: {{ int64 $vals.uid }}
    runAsGroup: {{ int64 $vals.gid }}
    allowPrivilegeEscalation: false
    capabilities:
      drop: ["ALL"]
    runAsNonRoot: true
    seccompProfile:
      type: RuntimeDefault
  {{- end }}
{{- end }}