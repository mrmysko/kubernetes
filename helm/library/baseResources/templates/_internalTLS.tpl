{{- define "baseResources.internalTLS" -}}
{{- $root := .root | default . }}
{{- $vals := .vals | default $root.Values.app }}
{{- $serviceName := include "baseResources.serviceName" (dict "root" $root "vals" $vals) }}

apiVersion: gateway.networking.k8s.io/v1
kind: BackendTLSPolicy
metadata:
  name: {{ printf "%s-tls-policy" $root.Release.Name | quote }}
spec:

  targetRefs:
    - group: ""
      kind: Service
      name: {{ $serviceName | quote }}
      sectionName: https

  validation:
    hostname: {{ printf "%s.%s.svc.cluster.local" $serviceName $root.Release.Namespace | quote }}
    caCertificateRefs:
      - name: {{ printf "%s-server-cert" $root.Release.Name | quote }}
        group: ""
        kind: Secret
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: {{ printf "%s-server-cert" $root.Release.Name | quote }}
  labels:
    {{- include "common.labels" $root | nindent 4 }}
spec:
  secretName: {{ printf "%s-server-cert" $root.Release.Name | quote }}
  issuerRef:
    name: cluster-ca
    kind: ClusterIssuer
  privateKey:
    rotationPolicy: Always
  commonName: {{ printf "%s.%s.svc.cluster.local" $serviceName $root.Release.Namespace | quote }}
  dnsNames:
    - {{ printf "%s.%s.svc.cluster.local" $serviceName $root.Release.Namespace | quote }}
    - {{ printf "%s.%s.svc.cluster" $serviceName $root.Release.Namespace | quote }}
    - {{ printf "%s.%s.svc" $serviceName $root.Release.Namespace | quote }}
    - {{ printf "%s.%s" $serviceName $root.Release.Namespace | quote }}
    - {{ printf "%s" $serviceName | quote }}
    - localhost
{{- end -}}