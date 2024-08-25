<!--
NOTA: Este README foi creado automáticamente por <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON debe editarse manualmente.
-->

# mlmmj para YunoHost

[![Nivel de integración](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Estado de funcionamento](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Estado de mantemento](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Instalar mlmmj con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Le este README en outros idiomas.](./ALL_README.md)*

> *Este paquete permíteche instalar mlmmj de xeito rápido e doado nun servidor YunoHost.*  
> *Se non usas YunoHost, le a [documentación](https://yunohost.org/install) para saber como instalalo.*

## Vista xeral

MLMMJ is a mailing list manager notable for its low memory and CPU footprint, requiring no database. Designed to be file-managed, MLMMJ lacks a native graphical interface, though independent graphical interfaces do exist. With Yunohost, the aim is to enable comprehensive management through its configuration panel.

The Yunohost MLMMJ package is pre-configured for Yunohost's email environment. It integrates many key MLMMJ features into a user-friendly configuration panel, including:

* Subscription and unsubscription processes.
* List moderation options and digest mode.
* Customization of email subjects and footers.
* Archiving settings.
* ...

For specific functionalities not covered in the panel, users are encouraged to [open a request](https://github.com/YunoHost-Apps/mlmmj_ynh/issues) on the package's GitHub page, fostering continuous development and customization.


**Versión proporcionada:** 1.4.3~ynh1

## Capturas de pantalla

![Captura de pantalla de mlmmj](./doc/screenshots/panel.png)

## Documentación e recursos

- Web oficial da app: <https://codeberg.org/mlmmj/mlmmj>
- Documentación oficial para usuarias: <https://codeberg.org/mlmmj/mlmmj>
- Documentación oficial para admin: <https://codeberg.org/mlmmj/mlmmj>
- Repositorio de orixe do código: <https://codeberg.org/mlmmj/mlmmj>
- Tenda YunoHost: <https://apps.yunohost.org/app/mlmmj>
- Informar dun problema: <https://github.com/YunoHost-Apps/mlmmj_ynh/issues>

## Info de desenvolvemento

Envía a túa colaboración á [rama `testing`](https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing).

Para probar a rama `testing`, procede deste xeito:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mlmmj -u https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
```

**Máis info sobre o empaquetado da app:** <https://yunohost.org/packaging_apps>
