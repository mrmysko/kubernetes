{{- define "baseResources.internalTLS" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values.app }}
{{- $serviceName := include "baseResources.serviceName" (dict "root" $root "vals" $vals) }}

apiVersion: gateway.networking.k8s.io/v1
kind: BackendTLSPolicy
metadata:
  name: {{ printf "%s-tls-policy" $root.Release.Name }}
spec:

  targetRefs:
    - group: ""
      kind: Service
      name: {{ $serviceName }}
      sectionName: https

  validation:
    hostname: {{ printf "%s.%s.svc.cluster.local" $serviceName $root.Release.Namespace }}
    caCertificateRefs:
      - name: {{ printf "%s-server-cert" $root.Release.Name }}
        group: ""
        kind: Secret
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: {{ printf "%s-server-cert" $root.Release.Name }}
  labels:
    {{- include "common.labels" $root | nindent 4 }}
spec:
  secretName: {{ printf "%s-server-cert" $root.Release.Name }}
  issuerRef:
    name: cluster-ca
    kind: ClusterIssuer
  privateKey:
    rotationPolicy: Always
  commonName: {{ printf "%s.%s.svc.cluster.local" $serviceName $root.Release.Namespace }}
  dnsNames:
    - {{ printf "%s.%s.svc.cluster.local" $serviceName $root.Release.Namespace }}
    - {{ printf "%s.%s.svc.cluster" $serviceName $root.Release.Namespace }}
    - {{ printf "%s.%s.svc" $serviceName $root.Release.Namespace }}
    - {{ printf "%s.%s" $serviceName $root.Release.Namespace }}
    - {{ printf "%s" $serviceName}}
    - localhost
{{- end -}}