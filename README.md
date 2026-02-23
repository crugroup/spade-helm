Spade
=======

A Helm chart for Spade with Spade UI

## Chart Values

### Docker Images

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| docker.spade.image | string | `"ghcr.io/crugroup/spadekit"` | Spade backend image |
| docker.spade.tag | string | `"latest"` | Spade backend image tag |
| docker.spadeUI.image | string | `"ghcr.io/crugroup/spadeui"` | Spade UI image |
| docker.spadeUI.tag | string | `"latest"` | Spade UI image tag |

### Ingress

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ingress.className | string | `"nginx"` | Ingress class name |
| ingress.spade.host | string | `"backend"` | Hostname for the spade backend ingress |
| ingress.spade.path | string | `"/"` | Path for the spade backend ingress |
| ingress.spade.annotations | object | `{}` | Additional annotations for the spade backend ingress |
| ingress.spadeUI.host | string | `"frontend"` | Hostname for the spade UI ingress |
| ingress.spadeUI.path | string | `"/"` | Path for the spade UI ingress |
| ingress.spadeUI.annotations | object | `{}` | Additional annotations for the spade UI ingress |

### Spade Backend

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| spade.replicas | int | `1` | Number of spade backend replicas |
| spade.pullPolicy | string | `"Always"` | Image pull policy for the spade backend |
| spade.priorityClassName | string | `""` | Priority class name for spade backend pods |
| spade.nodeSelector | object | `{}` | Node selector for spade backend pods |
| spade.affinity | object | `{}` | Affinity rules for spade backend pods |
| spade.tolerations | list | `[]` | Tolerations for spade backend pods |
| spade.resources | object | `{}` | Resource requests and limits for spade backend pods |
| spade.podDisruptionBudget.enabled | bool | `false` | Create a PodDisruptionBudget for the spade backend |
| spade.podDisruptionBudget.config | object | `{"maxUnavailable": 1}` | PodDisruptionBudget spec for the spade backend |
| spade.env | list | `[]` | Extra environment variables for the spade backend. Each item may be a plain value (`name`, `value`) or reference an ExternalSecret (`name`, `externalSecret: true`, `secretName`, `secretKey`) |

### Spade Django Settings

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| spade.django.settingsModule | string | `"config.settings.production"` | Django settings module |
| spade.django.allowedHosts | string | `""` | Additional comma-separated allowed hosts (the backend ingress host is always included) |
| spade.django.adminUrl | string | `"admin/"` | URL path for the Django admin interface |
| spade.django.collectFastStrategy | string | `"collectfast.strategies.filesystem.FileSystemStrategy"` | Collectfast strategy for static file collection |
| spade.django.ssl.redirect | bool | `false` | Redirect HTTP requests to HTTPS |
| spade.django.secretKey.externalSecret | bool | `false` | Read the Django secret key from an ExternalSecret |
| spade.django.secretKey.value | string | `"Srxt2kGXi0..."` | Django secret key (used when `externalSecret` is `false`) |
| spade.django.fieldEncryptionKey.externalSecret | bool | `false` | Read the field encryption key from an ExternalSecret |
| spade.django.fieldEncryptionKey.value | string | `""` | Field encryption key (used when `externalSecret` is `false`) |

### Spade UI

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| spadeUI.replicas | int | `1` | Number of spade UI replicas |
| spadeUI.pullPolicy | string | `"Always"` | Image pull policy for the spade UI |
| spadeUI.priorityClassName | string | `""` | Priority class name for spade UI pods |
| spadeUI.nodeSelector | object | `{}` | Node selector for spade UI pods |
| spadeUI.affinity | object | `{}` | Affinity rules for spade UI pods |
| spadeUI.tolerations | list | `[]` | Tolerations for spade UI pods |
| spadeUI.resources | object | `{}` | Resource requests and limits for spade UI pods |
| spadeUI.podDisruptionBudget.enabled | bool | `false` | Create a PodDisruptionBudget for the spade UI |
| spadeUI.podDisruptionBudget.config | object | `{"maxUnavailable": 1}` | PodDisruptionBudget spec for the spade UI |
| spadeUI.env | list | `[]` | Extra environment variables for the spade UI |

### PostgreSQL

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgresql.enabled | bool | `false` | Deploy a PostgreSQL instance as part of this release (uses the Bitnami PostgreSQL chart) |
| postgresql.postgresHost | string | `"postgresql"` | Hostname of an external PostgreSQL server (used when `postgresql.enabled` is `false`) |
| postgresql.service.port | int | `5432` | PostgreSQL service port |
| postgresql.auth.username | string | `"spade"` | PostgreSQL username |
| postgresql.auth.database | string | `"spade"` | PostgreSQL database name |
| postgresql.auth.password.externalSecret | bool | `false` | Read the PostgreSQL password from an ExternalSecret |
| postgresql.auth.password.value | string | `"3zLFpL6P..."` | PostgreSQL password (used when `externalSecret` is `false`) |
