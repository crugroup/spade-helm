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

{{- define "spade.env" -}}
{{- $env := .Values.spade.env -}}

{{- if .Values.postgresql.auth.password.externalSecret -}}
{{- $env = append $env (dict
  "name" "POSTGRES_PASSWORD"
  "valueFrom" (dict
    "secretKeyRef" (dict
      "name" .Values.postgresql.auth.password.secretName
      "key"  .Values.postgresql.auth.password.secretKey
    )
  )
) -}}
{{- end -}}

{{- if .Values.spade.django.secretKey.externalSecret -}}
{{- $env = append $env (dict
  "name" "DJANGO_SECRET_KEY"
  "valueFrom" (dict
    "secretKeyRef" (dict
      "name" .Values.spade.django.secretKey.secretName
      "key"  .Values.spade.django.secretKey.secretKey
    )
  )
) -}}
{{- end -}}

{{- if .Values.spade.django.fieldEncryptionKey.externalSecret -}}
{{- $env = append $env (dict
  "name" "FIELD_ENCRYPTION_KEY"
  "valueFrom" (dict
    "secretKeyRef" (dict
      "name" .Values.spade.django.fieldEncryptionKey.secretName
      "key"  .Values.spade.django.fieldEncryptionKey.secretKey
    )
  )
) -}}
{{- end -}}

{{- toYaml $env -}}
{{- end -}}

{{- define "spadeUI.env" -}}
{{- $env := .Values.spadeUI.env -}}

{{- $env = append $env (dict
  "name" "VITE_BACKEND_BASE_URL"
  "value" (printf "https://%s/api/v1" .Values.ingress.spade.host)
) -}}

{{- toYaml $env -}}
{{- end -}}
