{{- define "common.names.fullname" -}}
{{- if contains .Release.Name .Chart.Name }}
{{- printf "%s" .Release.Name }}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}
{{- end -}}

{{- define "panel.fullname" -}}
{{- printf "%s-panel" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kuber.fullname" -}}
{{- printf "%s-kuber" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kubectyl.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
