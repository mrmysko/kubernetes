{{- define "default-svc.service" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ print .Release.Name "-svc" | quote }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
spec:
  type: ClusterIP
  selector:
    app.kubernetes.io/instance: {{ .Release.Name | quote }}
    app.kubernetes.io/component: {{ .Values.component | default "frontend" | quote }}
  ports:
    - protocol: TCP
      port: {{ .Values.service.port }}
      targetPort: {{ .Values.service.port }}
{{- end -}}