# MariaDB
{{- define "baseResources.waitForMariadb" -}}
name: wait-for-mariadb
image: {{ .Values.database.image | default "mariadb:11" | quote }}
command:
  - sh
  - -c
  - >
    until mariadb-admin ping -h "${DB_HOST}" -u"${DB_USER}" -p"${DB_PASSWORD}" -s;
    do echo "Waiting for MariaDB..."; sleep 3;
    done
env:
  - name: DB_HOST
    value: {{ .Values.database.host | quote }}
  - name: DB_USER
    value: {{ .Values.database.username | quote }}
  - name: DB_PASSWORD
    value: {{ .Values.database.password | quote }}
{{- end }}
---
# Postgres
{{- define "baseResources.waitForPostgres" -}}
name: wait-for-postgres
image: {{ .Values.mainDb.image | default "postgres:17-alpine" | quote }}
command:
  - sh
  - -c
  - |
    until pg_isready -h {{ .Values.mainDb.host }} -p {{ .Values.mainDb.port | default 5432 }} -U "{{ .Values.mainDb.owner }}"; do
      echo "Waiting for PostgreSQL to be ready..."
      sleep 2
    done
    echo "PostgreSQL is ready!"
securityContext:
  capabilities:
    drop: ["ALL"]
  allowPrivilegeEscalation: false
{{- end }}
---
# Samba
{{- define "baseResources.waitForSamba" -}}
name: wait-for-samba
image: alpine:3.20
command:
  - /bin/sh
  - -c
  - |
    apk add --no-cache samba-client > /dev/null
    echo "Waiting for SMB share "//${SMB_URL}/${SMB_SHARE}"..."
    until smbclient -L "//${SMB_URL}" -U "${SMB_USER}%${SMB_PASS}" -m SMB3 >/dev/null 2>&1; do
      echo "Samba share not ready yet, retrying..."
      sleep 5
    done
    echo "Samba share is available."
env:
  - name: SMB_URL
    value: "{{ .Values.storage.smb.url }}"
  - name: SMB_SHARE
    value: "{{ .Values.storage.smb.share }}"
  - name: SMB_USER
    value: "{{ .Values.storage.smb.username }}"
  - name: SMB_PASS
    value: "{{ .Values.storage.smb.password }}"

securityContext:
  capabilities:
    drop: ["ALL"]
  seccompProfile:
    type: RuntimeDefault
{{- end }}