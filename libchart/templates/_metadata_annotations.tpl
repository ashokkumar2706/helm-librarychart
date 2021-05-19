{{- /*
libchart.hook defines a hook.

This is to be used in a 'metadata.annotations' section.

This should be called as 'template "libchart.metadata.hook" "post-install"'

Any valid hook may be passed in. Separate multiple hooks with a ",".
*/ -}}
{{- define "libchart.hook" -}}
"helm.sh/hook": {{printf "%s" . | quote}}
{{- end -}}

{{- define "libchart.annote" -}}
{{- range $k, $v := . }}
{{ $k | quote }}: {{ $v | quote }}
{{- end -}}
{{- end -}}
