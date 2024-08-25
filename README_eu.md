<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# mlmmj YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Instalatu mlmmj YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek mlmmj YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

MLMMJ is a mailing list manager notable for its low memory and CPU footprint, requiring no database. Designed to be file-managed, MLMMJ lacks a native graphical interface, though independent graphical interfaces do exist. With Yunohost, the aim is to enable comprehensive management through its configuration panel.

The Yunohost MLMMJ package is pre-configured for Yunohost's email environment. It integrates many key MLMMJ features into a user-friendly configuration panel, including:

* Subscription and unsubscription processes.
* List moderation options and digest mode.
* Customization of email subjects and footers.
* Archiving settings.
* ...

For specific functionalities not covered in the panel, users are encouraged to [open a request](https://github.com/YunoHost-Apps/mlmmj_ynh/issues) on the package's GitHub page, fostering continuous development and customization.


**Paketatutako bertsioa:** 1.4.3~ynh1

## Pantaila-argazkiak

![mlmmj(r)en pantaila-argazkia](./doc/screenshots/panel.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://codeberg.org/mlmmj/mlmmj>
- Erabiltzaileen dokumentazio ofiziala: <https://codeberg.org/mlmmj/mlmmj>
- Administratzaileen dokumentazio ofiziala: <https://codeberg.org/mlmmj/mlmmj>
- Jatorrizko aplikazioaren kode-gordailua: <https://codeberg.org/mlmmj/mlmmj>
- YunoHost Denda: <https://apps.yunohost.org/app/mlmmj>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/mlmmj_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
edo
sudo yunohost app upgrade mlmmj -u https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
