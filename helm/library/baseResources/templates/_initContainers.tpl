# MariaDB
{{- define "baseResources.waitForMariadb" -}}
- name: wait-for-mariadb
  image: {{ .image | default "mariadb:11" | quote }}
  command:
    - sh
    - -c
    - |
      until mariadb-admin ping -h "${DB_HOST}" -u"${DB_USER}" -p"${DB_PASSWORD}" 2>&1;
      do echo "Waiting for MariaDB..."; sleep 3;
      done

  env:
    - name: DB_HOST
      value: {{ .host | quote }}
    - name: DB_USER
      value: {{ .username | quote }}
    - name: DB_PASSWORD
      value: {{ .password | quote }}

  securityContext:
    allowPrivilegeEscalation: false
    seccompProfile:
      type: RuntimeDefault
{{- end }}
---
# Postgres
{{- define "baseResources.waitForPostgres" -}}
- name: wait-for-postgres
  image: {{ .image | default "postgres:17-alpine" | quote }}
  command:
    - sh
    - -c
    - |
      until pg_isready -h "${DB_HOST}" -p "${DB_PORT}" -U "${DB_USER}"; do
        echo "Waiting for PostgreSQL to be ready..."
        sleep 2
      done
      echo "PostgreSQL is ready!"

  env:
    - name: DB_HOST
      value: {{ .host | quote }}
    - name: DB_PORT
      value: {{ .port | default 5432 | quote }}
    - name: DB_USER
      value: {{ .owner | quote }}

  securityContext:
    allowPrivilegeEscalation: false
    runAsNonRoot: true
    runAsUser: 1000
    capabilities:
      drop: ["ALL"]
    seccompProfile:
      type: RuntimeDefault
{{- end }}
---
# Samba
{{- define "baseResources.waitForSamba" -}}
- name: wait-for-samba
  image: alpine:3.20
  command:
    - /bin/sh
    - -c
    - |
      apk add --no-cache samba-client > /dev/null
      echo "Waiting for SMB share //${SMB_URL}/${SMB_SHARE}..."
      until smbclient -L "//${SMB_URL}" -U "${SMB_USER}%${SMB_PASS}" -m SMB3; do
        echo "Samba share not ready yet, retrying..."
        sleep 5
      done
      echo "Samba share is available."

  env:
    - name: SMB_URL
      value: {{ .url | quote }}
    - name: SMB_SHARE
      value: {{ .share | quote }}
    - name: SMB_USER
      value: {{ .username | quote }}
    - name: SMB_PASS
      value: {{ .password | quote }}

  securityContext:
    capabilities:
      drop: ["ALL"]
    seccompProfile:
      type: RuntimeDefault
{{- end }}
---
{{- define "baseResources.waitForRedis" -}}
- name: wait-for-redis
  image: {{ .image | default "redis:7" | quote }}
  command:
    - sh
    - -c
    - |
      until redis-cli -h "${REDIS_HOST}" -a "${REDIS_PASSWORD}" ping 2>&1 | grep -q PONG;
      do echo "Waiting for Redis..."; sleep 3;
      done
  env:
    - name: REDIS_HOST
      value: {{ .host | quote }}
    - name: REDIS_PASSWORD
      value: {{ .password | quote }}
  securityContext:
    allowPrivilegeEscalation: false
    seccompProfile:
      type: RuntimeDefault
{{- end }}