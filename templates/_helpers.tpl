{{- define "spade.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "spade.image" -}}
{{- printf "%s:%s" .Values.docker.spade.image .Values.docker.spade.tag -}}
{{- end -}}

{{- define "spadeUI.image" -}}
{{- printf "%s:%s" .Values.docker.spadeUI.image .Values.docker.spadeUI.tag -}}
{{- end -}}

{{- define "spade.postgresql.host" -}}
{{- if .Values.postgresql.postgresHost }}
    {{- .Values.postgresql.postgresHost -}}
{{- else }}
    {{- $name := default "postgresql" .Values.postgresql.nameOverride -}}
    {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "spade.emailHost" -}}
{{- if .Values.ingress.spade.host }}
    {{- .Values.ingress.spade.host -}}
{{- else }}
    spade.local
{{- end -}}
{{- end -}}
