# challenge-api

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

An API service created as part of the Skyward Solutions DevOps Interview Challenge

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| containerPorts[0] | int | `8000` |  |
| domain | string | `"grove.sirwac.net"` |  |
| environment | string | `"dev"` |  |
| environmentVariables | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"grover424/challenge-api"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"traefik"` |  |
| ingress.annotations."traefik.ingress.kubernetes.io/router.entrypoints" | string | `"websecure,web"` |  |
| ingress.annotations."traefik.ingress.kubernetes.io/router.middlewares" | string | `"challenge-api-ssl-redirect@kubernetescrd"` |  |
| ingress.certificate.duration | string | `"2160h"` |  |
| ingress.certificate.environment | string | `"production"` |  |
| ingress.certificate.organization | string | `"Grove"` |  |
| ingress.certificate.renewalLeadTime | string | `"360h"` |  |
| ingress.className | string | `"traefik"` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts[0].host | string | `"challenge-api.grove.sirwac.net"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.tls[0].hosts[0] | string | `"challenge-api.grove.sirwac.net"` |  |
| ingress.tls[0].secretName | string | `"certificate-api"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistentVolumeClaims | list | `[]` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| securityContext | object | `{}` |  |
| service.port | int | `8000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceName | string | `"api"` |  |
| system | string | `"challenge"` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

