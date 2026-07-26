{{- /*Basename*/ -}}
{{- define "baseResources.fullname" -}}
{{- $root := .root | default . -}}
{{- $releaseName := lower $root.Release.Name -}}
{{- $chartName := lower $root.Chart.Name -}}

{{- $name := "" -}}

{{- if $root.Values.fullnameOverride -}}
  {{- $name = lower $root.Values.fullnameOverride -}}
{{- else if contains $chartName $releaseName -}}
  {{- /* Release name already contains chart name — avoid duplication */ -}}
  {{- $name = $releaseName -}}
{{- else if contains $releaseName $chartName -}}
  {{- /* Chart name already contains release name — use chart name */ -}}
  {{- $name = $chartName -}}
{{- else -}}
  {{- $name = printf "%s-%s" $releaseName $chartName -}}
{{- end -}}
{{- $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- /* Resource Naming */ -}}
{{- define "baseResources.resourceName" -}}
{{- $root := .root -}}
{{- $vals := .vals -}}
{{- $fullname := include "baseResources.fullname" $root -}}

{{- if $vals.nameOverride -}}
{{- printf "%s" $vals.nameOverride -}}
{{- else if $vals.component -}}
{{- printf "%s-%s" $fullname $vals.component -}}
{{- else -}}
{{- $fullname -}}
{{- end -}}
{{- end -}}

{{- /* Service Naming */ -}}
{{- define "baseResources.serviceName" -}}
{{- $resourceName := include "baseResources.resourceName" . -}}

{{- if .vals.service.nameOverride -}}
{{- .vals.service.nameOverride -}}
{{- else -}}
{{- printf "%s-svc" $resourceName -}}
{{- end -}}
{{- end -}}