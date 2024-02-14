Spade
=======

A Helm chart for Spade with Spade UI

## Chart Values

|Key                             |Type  |Default                                                         |Description                                                         |
|--------------------------------|------|----------------------------------------------------------------|--------------------------------------------------------------------|
|docker.spade.image              |string|`"ghcr.io/crugroup/spade"`                                      |Image for spade backend                                             |
|docker.spade.tag                |string|`"latest"`                                                      |Tag for spade backend image                                         |
|docker.spadeUI.image            |string|`"ghcr.io/crugroup/spadeui"`                                    |Image for spade frontend                                            |
|docker.spadeUI.tag              |string|`"latest"`                                                      |Tag for spade frontend image                                        |
|spade.django.allowedHosts       |string|`"backend"`                                                     |Comma-separated list of hosts that are allowed to access the backend|
|spade.django.adminUrl           |string|`"admin/"`                                                      |URL for the admin interface                                         |
|spade.django.collectFastStrategy|string|`"collectfast.strategies.filesystem.FileSystemStrategy"`        |Collectfast strategy to use                                         |
|spade.django.settingsModule     |string|`"config.settings.production"`                                  |Django settings module to use                                       |
|spade.django.ssl.redirect       |bool  |`false`                                                         |Whether to redirect to HTTPS                                        |
|spade.django.secretKey          |string|`"Srxt2kGXi0ErSF1ApgK5ZJyMDNHyetTLbaa67tPitMtl9cdpkwnDTTDZCjsGDlIO"`|Django secret key                                                   |
|spade.django.fieldEncryptionKey |string|`"SFlac1ZScXpYQ1c4dWl6ZVFrWks5R3drOUhJakpPdHI="`                |Field encryption key                                                |
|spade.pullPolicy                |string|`"Always"`                                                      |Pull policy for spade backend container                             |
|spadeUI.webserver.publicDomain  |string|`"https://frontend"`                                            |Public domain for the frontend (used for CORS)                      |
|spadeUI.pullPolicy              |string|`"Always"`                                                      |Pull policy for spade frontend container                            |
|worker.replicas                 |int   |`1`                                                             |Number of worker replicas                                           |
|ingress.className               |string|`"nginx"`                                                       |Ingress class to use                                                |
|ingress.spade.path              |string|`"/"`                                                           |Path for spade backend container                                    |
|ingress.spade.host              |string|`"backend"`                                                     |Domain for spade backend container                                  |
|ingress.spadeUI.path            |string|`"/"`                                                           |Path for spade frontend container                                   |
|ingress.spadeUI.host            |string|`"frontend"`                                                    |Domain for spade frontend container                                 |
|postgresql.enabled              |bool  |`false`                                                         |Whether to create a new PostgreSQL container with spade             |
|postgresql.auth.username        |string|`"spade"`                                                       |PostgreSQL username                                                 |
|postgresql.auth.database        |string|`"spade"`                                                       |PostgreSQL database name                                            |
|postgresql.auth.password        |string|`"3zLFpL6PVRHtBL91rM6ST24faVJU8a6z"`                            |PostgreSQL password                                                 |
|postgresql.service.port         |string|`"5432"`                                                        |PostgreSQL service port                                             |
