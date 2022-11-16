# sto-manager

![Version: 0.2.14](https://img.shields.io/badge/Version-0.2.14-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.778.0](https://img.shields.io/badge/AppVersion-1.778.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| addOnImage.image.digest | string | `""` |  |
| addOnImage.image.pullPolicy | string | `"IfNotPresent"` |  |
| addOnImage.image.registry | string | `"docker.io"` |  |
| addOnImage.image.repository | string | `"harness/ci-addon"` |  |
| addOnImage.image.tag | string | `"1.14.19"` |  |
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `true` |  |
| autoscaling.maxReplicas | int | `2` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| defaultInternalImageConnector | string | `"test"` |  |
| fullnameOverride | string | `""` |  |
| global.delegate.airgapped | bool | `false` |  |
| global.loadbalancerURL | string | `"https://test"` |  |
| image.digest | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"harness/stomanager-signed"` |  |
| image.tag | string | `"77800-000"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| java.memory | int | `2500` |  |
| java.memoryLimit | int | `600` |  |
| leImage.image.digest | string | `""` |  |
| leImage.image.pullPolicy | string | `"IfNotPresent"` |  |
| leImage.image.registry | string | `"docker.io"` |  |
| leImage.image.repository | string | `"harness/ci-lite-engine"` |  |
| leImage.image.tag | string | `"1.14.22"` |  |
| maxSurge | string | `"100%"` |  |
| maxUnavailable | int | `0` |  |
| mongoSecrets.password.key | string | `"mongodb-root-password"` |  |
| mongoSecrets.password.name | string | `"mongodb-replicaset-chart"` |  |
| mongoSecrets.userName.key | string | `"mongodbUsername"` |  |
| mongoSecrets.userName.name | string | `"harness-secrets"` |  |
| nameOverride | string | `""` |  |
| ngServiceAccount | string | `"test"` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probes.livenessProbe.failureThreshold | int | `5` |  |
| probes.livenessProbe.httpGet.path | string | `"/health"` |  |
| probes.livenessProbe.httpGet.port | string | `"http"` |  |
| probes.livenessProbe.periodSeconds | int | `5` |  |
| probes.livenessProbe.timeoutSeconds | int | `2` |  |
| probes.readinessProbe.failureThreshold | int | `5` |  |
| probes.readinessProbe.httpGet.path | string | `"/health"` |  |
| probes.readinessProbe.httpGet.port | string | `"http"` |  |
| probes.readinessProbe.periodSeconds | int | `10` |  |
| probes.readinessProbe.timeoutSeconds | int | `2` |  |
| probes.startupProbe.failureThreshold | int | `25` |  |
| probes.startupProbe.httpGet.path | string | `"/health"` |  |
| probes.startupProbe.httpGet.port | string | `"http"` |  |
| probes.startupProbe.periodSeconds | int | `10` |  |
| probes.startupProbe.timeoutSeconds | int | `2` |  |
| redislabsCATruststore | string | `"test"` |  |
| replicaCount | int | `1` |  |
| resources.requests.cpu | int | `1` |  |
| resources.requests.memory | string | `"3Gi"` |  |
| s3UploadImage.image.digest | string | `""` |  |
| s3UploadImage.image.pullPolicy | string | `"IfNotPresent"` |  |
| s3UploadImage.image.registry | string | `"docker.io"` |  |
| s3UploadImage.image.repository | string | `"bewithaman/s3"` |  |
| s3UploadImage.image.tag | string | `"latest"` |  |
| securityContext | object | `{}` |  |
| securityImage.image.digest | string | `""` |  |
| securityImage.image.pullPolicy | string | `"IfNotPresent"` |  |
| securityImage.image.registry | string | `"docker.io"` |  |
| securityImage.image.repository | string | `"harness/sto-plugin"` |  |
| securityImage.image.tag | string | `"1.1.5.dev1668454818"` |  |
| service.grpcport | int | `9979` |  |
| service.port | int | `7090` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"harness-default"` |  |
| stoServiceGlobalToken.key | string | `"stoAppHarnessToken"` |  |
| stoServiceGlobalToken.name | string | `"harness-secrets"` |  |
| timescaleSecret.password.key | string | `"timescaledbPostgresPassword"` |  |
| timescaleSecret.password.name | string | `"harness-secrets"` |  |
| tolerations | list | `[]` |  |
| waitForInitContainer.image.digest | string | `""` |  |
| waitForInitContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| waitForInitContainer.image.registry | string | `"docker.io"` |  |
| waitForInitContainer.image.repository | string | `"harness/helm-init-container"` |  |
| waitForInitContainer.image.tag | string | `"latest"` |  |

