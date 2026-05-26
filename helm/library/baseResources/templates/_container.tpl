{{- define "baseResources.baseContainer" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values }}
{{- $fullname := include "baseResources.fullname" (dict "root" $root "vals" $vals) }}

- name: {{ $fullname }}
  image: "{{ $vals.image.repository }}:{{ $vals.image.tag | default $root.Chart.AppVersion }}"
  imagePullPolicy: {{ $vals.image.pullPolicy | default "IfNotPresent" }}

  ports:
    {{- range $vals.service.ports }}
    - name: {{ .name }}
      containerPort: {{ .targetPort }}
      protocol: {{ .protocol }}
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
    runAsUser: {{ $vals.uid }}
    runAsGroup: {{ $vals.gid }}
    allowPrivilegeEscalation: false
    capabilities:
      drop: ["ALL"]
    runAsNonRoot: true
    seccompProfile:
      type: RuntimeDefault
  {{- end }}
{{- end }}