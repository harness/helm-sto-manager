{{/*
Expand the name of the chart.
*/}}
{{- define "sto-manager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sto-manager.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sto-manager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sto-manager.labels" -}}
helm.sh/chart: {{ include "sto-manager.chart" . }}
{{ include "sto-manager.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sto-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sto-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sto-manager.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sto-manager.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "sto-manager.deploymentEnv" -}}
- name: DB_PASSWORD
  valueFrom:
    secretKeyRef:
        name: postgres
        key: postgres-password
- { name: APP_DATABASE_DATASOURCE, value: "{{ printf "postgres://postgres:$(DB_PASSWORD)@postgres:5432" }}" }
- { name: APP_DB_MIGRATION_DATASOURCE, value: "{{ printf "postgres://postgres:$(DB_PASSWORD)@postgres:5432" }}" }
{{- end }}

{{/*
Create the name of the redis image to use
*/}}
{{- define "sto-manager.s3UploadImage" -}}
{{- if .Values.global.imageRegistry -}}
{{- printf "%s/%s:%s" .Values.global.imageRegistry ((splitList "/" .Values.s3UploadImage.image.repository) | last) .Values.s3UploadImage.image.tag -}}
{{- else -}}
{{- printf "%s:%s" .Values.s3UploadImage.image.repository .Values.s3UploadImage.image.tag -}}
{{- end -}}
{{- end }}

{{/*
Create the name of the sentinet image to use
*/}}
{{- define "sto-manager.securityImage" -}}
{{- if .Values.global.imageRegistry -}}
{{- printf "%s/%s:%s" .Values.global.imageRegistry ((splitList "/" .Values.securityImage.image.repository) | last) .Values.securityImage.image.tag -}}
{{- else -}}
{{- printf "%s:%s" .Values.securityImage.image.repository .Values.securityImage.image.tag -}}
{{- end -}}
{{- end }}
