{{- define "baseResources.fullname" -}}
{{- /*
  Usage: include "baseResources.fullname" (dict "root" .)
  Falls back to "." if called without a root key.
*/ -}}
{{- $root := .root | default . -}}
{{- $releaseName := $root.Release.Name -}}
{{- $chartName := $root.Chart.Name -}}
{{- $releaseNameLower := lower $releaseName -}}
{{- $chartNameLower := lower $chartName -}}
{{- $name := "" -}}
{{- if $root.Values.fullnameOverride -}}
  {{- $name = $root.Values.fullnameOverride | lower -}}
{{- else if contains $chartNameLower $releaseNameLower -}}
  {{- /* Release name already contains chart name — avoid duplication */ -}}
  {{- $name = $releaseNameLower -}}
{{- else if contains $releaseNameLower $chartNameLower -}}
  {{- /* Chart name already contains release name — use chart name */ -}}
  {{- $name = $chartNameLower -}}
{{- else -}}
  {{- $name = printf "%s-%s" $releaseNameLower $chartNameLower -}}
{{- end -}}
{{- $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}