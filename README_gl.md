<!--
NOTA: Este README foi creado automáticamente por <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON debe editarse manualmente.
-->

# Mailing List Manager para YunoHost

[![Nivel de integración](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Estado de funcionamento](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Estado de mantemento](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Instalar Mailing List Manager con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Le este README en outros idiomas.](./ALL_README.md)*

> *Este paquete permíteche instalar Mailing List Manager de xeito rápido e doado nun servidor YunoHost.*  
> *Se non usas YunoHost, le a [documentación](https://yunohost.org/install) para saber como instalalo.*

## Vista xeral

MLMMJ is a mailing list manager notable for its low memory and CPU footprint, requiring no database. Designed to be file-managed, MLMMJ lacks a native graphical interface, though independent graphical interfaces do exist.

In this YunoHost app, a configuration panel is provided in the webadmin (in the app's info page) and allows to configure settings such as:
- Subscription and posting policy
- Moderation options
- Customization of email subjects and footers.
- Add or remove subscribers

However for now, the package lacks:
- a web user interface to subscribe (for now people willing to subscribe should send an email to a special address, or ask admins to add them) 
- a web interface to browse the list's archive (but theoretically doable in the future)


**Versión proporcionada:** 1.4.7~ynh1

## Capturas de pantalla

![Captura de pantalla de Mailing List Manager](./doc/screenshots/panel.png)

## Documentación e recursos

- Web oficial da app: <https://mlmmj.org/>
- Documentación oficial para admin: <https://mlmmj.org/README.html>
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
