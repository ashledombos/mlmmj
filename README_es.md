<!--
Este archivo README esta generado automaticamente<https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
No se debe editar a mano.
-->

# Mailing List Manager para Yunohost

[![Nivel de integración](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Estado funcional](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Estado En Mantención](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Instalar Mailing List Manager con Yunhost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Leer este README en otros idiomas.](./ALL_README.md)*

> *Este paquete le permite instalarMailing List Manager rapidamente y simplement en un servidor YunoHost.*  
> *Si no tiene YunoHost, visita [the guide](https://yunohost.org/install) para aprender como instalarla.*

## Descripción general

MLMMJ is a mailing list manager notable for its low memory and CPU footprint, requiring no database. Designed to be file-managed, MLMMJ lacks a native graphical interface, though independent graphical interfaces do exist.

In this YunoHost app, a configuration panel is provided in the webadmin (in the app's info page) and allows to configure settings such as:
- Subscription and posting policy
- Moderation options
- Customization of email subjects and footers.
- Add or remove subscribers

However for now, the package lacks:
- a web user interface to subscribe (for now people willing to subscribe should send an email to a special address, or ask admins to add them) 
- a web interface to browse the list's archive (but theoretically doable in the future)


**Versión actual:** 1.4.3~ynh2

## Capturas

![Captura de Mailing List Manager](./doc/screenshots/panel.png)

## Documentaciones y recursos

- Sitio web oficial: <https://mlmmj.org/>
- Documentación administrador oficial: <https://mlmmj.org/README.html>
- Repositorio del código fuente oficial de la aplicación : <https://codeberg.org/mlmmj/mlmmj>
- Catálogo YunoHost: <https://apps.yunohost.org/app/mlmmj>
- Reportar un error: <https://github.com/YunoHost-Apps/mlmmj_ynh/issues>

## Información para desarrolladores

Por favor enviar sus correcciones a la [rama `testing`](https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing).

Para probar la rama `testing`, sigue asÍ:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
o
sudo yunohost app upgrade mlmmj -u https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
```

**Mas informaciones sobre el empaquetado de aplicaciones:** <https://yunohost.org/packaging_apps>
