{{- define "libchart.volume.configMap" -}}
        {{- $name := index . 0 -}}
        {{- $configMapName := index . 1 -}}

        name: {{ $name }}
        configMap:
          name: {{ $configMapName }}
{{- end -}}

{{- define "libchart.volume.pvc" -}}
        {{- $name := index . 0 -}}
        {{- $claimName := index . 1 -}}
        {{- $persistence := index . 2 -}}

        name: {{ $name }}
        {{- if $persistence.enabled }}
        persistentVolumeClaim:
          claimName: {{ $persistence.existingClaim | default $claimName }}
        {{- else }}
        emptyDir: {}
        {{- end -}}
{{- end -}}
