<!--
Este archivo README esta generado automaticamente<https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
No se debe editar a mano.
-->

# mlmmj para Yunohost

[![Nivel de integración](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Estado funcional](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Estado En Mantención](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Instalar mlmmj con Yunhost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Leer este README en otros idiomas.](./ALL_README.md)*

> *Este paquete le permite instalarmlmmj rapidamente y simplement en un servidor YunoHost.*  
> *Si no tiene YunoHost, visita [the guide](https://yunohost.org/install) para aprender como instalarla.*

## Descripción general

MLMMJ is a mailing list manager notable for its low memory and CPU footprint, requiring no database. Designed to be file-managed, MLMMJ lacks a native graphical interface, though independent graphical interfaces do exist. With Yunohost, the aim is to enable comprehensive management through its configuration panel.

The Yunohost MLMMJ package is pre-configured for Yunohost's email environment. It integrates many key MLMMJ features into a user-friendly configuration panel, including:

* Subscription and unsubscription processes.
* List moderation options and digest mode.
* Customization of email subjects and footers.
* Archiving settings.
* ...

For specific functionalities not covered in the panel, users are encouraged to [open a request](https://github.com/YunoHost-Apps/mlmmj_ynh/issues) on the package's GitHub page, fostering continuous development and customization.


**Versión actual:** 1.4.3~ynh1

## Capturas

![Captura de mlmmj](./doc/screenshots/panel.png)

## Documentaciones y recursos

- Sitio web oficial: <https://mlmmj.org/>
- Documentación administrador oficial: <https://mlmmj.org/README.html>
- Repositorio del código fuente oficial de la aplicación : <https://codeberg.org/mlmmj/mlmmj>
- Catálogo YunoHost: <https://apps.yunohost.org/app/mlmmj>
- Reportar un error: <https://github.com/YunoHost-Apps/mlmmj_ynh/issues>

## Información para desarrolladores

Por favor enviar sus correcciones a la [`branch testing`](https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing

Para probar la rama `testing`, sigue asÍ:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
o
sudo yunohost app upgrade mlmmj -u https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
```

**Mas informaciones sobre el empaquetado de aplicaciones:** <https://yunohost.org/packaging_apps>
