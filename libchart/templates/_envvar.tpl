{{- define "libchart.envvar.value" -}}
  {{- $name := index . 0 -}}
  {{- $value := index . 1 -}}

  name: {{ $name }}
  value: {{ default "" $value | quote }}
{{- end -}}

{{- define "libchart.envvar.configmap" -}}
  {{- $name := index . 0 -}}
  {{- $configMapName := index . 1 -}}
  {{- $configMapKey := index . 2 -}}

  name: {{ $name }}
  valueFrom:
    configMapKeyRef:
      name: {{ $configMapName }}
      key: {{ $configMapKey }}
{{- end -}}

{{- define "libchart.envvar.secret" -}}
  {{- $name := index . 0 -}}
  {{- $secretName := index . 1 -}}
  {{- $secretKey := index . 2 -}}

  name: {{ $name }}
  valueFrom:
    secretKeyRef:
      name: {{ $secretName }}
      key: {{ $secretKey }}
{{- end -}}
