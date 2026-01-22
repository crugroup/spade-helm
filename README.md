Spade
=======

A Helm chart for Spade with Spade UI

## Chart Values

|Key                                   |Type  |Default                                                           |Description                                                         |
|--------------------------------------|------|------------------------------------------------------------------|--------------------------------------------------------------------|
|docker.spade.image                    |string|`"ghcr.io/crugroup/spadekit"`                                     |Image for spade backend                                             |
|docker.spade.tag                      |string|`"latest"`                                                        |Tag for spade backend image                                         |
|docker.spadeUI.image                  |string|`"ghcr.io/crugroup/spadeui"`                                      |Image for spade frontend                                            |
|docker.spadeUI.tag                    |string|`"latest"`                                                        |Tag for spade frontend image                                        |
|spade.env                             |list  |`[]`                                                               |Extra environment variables for the spade backend                   |
|spade.django.adminUrl                 |string|`"admin/"`                                                        |URL for the admin interface                                         |
|spade.django.allowedHosts             |string|`""`                                                              |Comma-separated list of hosts that are allowed to access the backend|
|spade.django.collectFastStrategy      |string|`"collectfast.strategies.filesystem.FileSystemStrategy"`          |Collectfast strategy to use                                         |
|spade.django.settingsModule           |string|`"config.settings.production"`                                    |Django settings module to use                                       |
|spade.django.ssl.redirect             |bool  |`false`                                                           |Whether to redirect to HTTPS                                        |
|spade.django.secretKey                |string|`"Srxt2kGXi0ErSF1ApgK5ZJyMDNHyetTLbaa67tPitMtl9cdpkwnDTTDZCjsGDlIO"`|Django secret key                                                   |
|spade.django.fieldEncryptionKey       |string|`"SFlac1ZScXpYQ1c4dWl6ZVFrWks5R3drOUhJakpPdHI="`                  |Field encryption key                                                |
|spade.pullPolicy                      |string|`"Always"`                                                        |Pull policy for spade backend container                             |
|spade.priorityClassName               |string|`""`                                                              |PriorityClassName for the spade backend pods                        |
|spade.nodeSelector                    |object|`{}`                                                               |Node selector for spade backend pods                                |
|spade.resources                       |object|`{}`                                                               |Resource requests/limits for spade backend pods                     |
|spade.podDisruptionBudget.enabled     |bool  |`false`                                                           |Whether to create a PodDisruptionBudget for spade backend           |
|spade.podDisruptionBudget.config      |object|`{"minAvailable": 1}`                                             |PodDisruptionBudget spec for spade backend                          |
|spadeUI.env                           |list  |`[]`                                                               |Extra environment variables for the spade UI                        |
|spadeUI.pullPolicy                    |string|`"Always"`                                                        |Pull policy for spade frontend container                            |
|spadeUI.priorityClassName             |string|`""`                                                              |PriorityClassName for the spade UI pods                             |
|spadeUI.nodeSelector                  |object|`{}`                                                               |Node selector for spade UI pods                                     |
|spadeUI.resources                     |object|`{}`                                                               |Resource requests/limits for spade UI pods                          |
|spadeUI.podDisruptionBudget.enabled   |bool  |`false`                                                           |Whether to create a PodDisruptionBudget for spade UI                |
|spadeUI.podDisruptionBudget.config    |object|`{"minAvailable": 1}`                                             |PodDisruptionBudget spec for spade UI                               |
|worker.replicas                       |int   |`1`                                                                |Number of worker replicas                                           |
|worker.nodeSelector                   |object|`{}`                                                               |Node selector for worker pods                                       |
|worker.resources                      |object|`{}`                                                               |Resource requests/limits for worker pods                            |
|ingress.className                     |string|`"nginx"`                                                         |Ingress class to use                                                |
|ingress.spade.path                    |string|`"/"`                                                             |Path for spade backend ingress                                      |
|ingress.spade.host                    |string|`"backend"`                                                       |Host for spade backend ingress                                      |
|ingress.spade.annotations             |object|`{}`                                                               |Annotations for spade backend ingress                               |
|ingress.spadeUI.path                  |string|`"/"`                                                             |Path for spade UI ingress                                           |
|ingress.spadeUI.host                  |string|`"frontend"`                                                      |Host for spade UI ingress                                           |
|ingress.spadeUI.annotations           |object|`{}`                                                               |Annotations for spade UI ingress                                    |
|postgresql.enabled                    |bool  |`false`                                                           |Whether to create a new PostgreSQL container with spade             |
|postgresql.postgresHost               |string|`"postgresql"`                                                    |Hostname of the PostgreSQL server (when not creating one)           |
|postgresql.auth.username              |string|`"spade"`                                                         |PostgreSQL username                                                 |
|postgresql.auth.database              |string|`"spade"`                                                         |PostgreSQL database name                                            |
|postgresql.auth.password              |string|`"3zLFpL6PVRHtBL91rM6ST24faVJU8a6z"`                              |PostgreSQL password                                                 |
|postgresql.service.port               |int   |`5432`                                                            |PostgreSQL service port                                             |
