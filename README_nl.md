<!--
NB: Deze README is automatisch gegenereerd door <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Hij mag NIET handmatig aangepast worden.
-->

# Mailing List Manager voor Yunohost

[![Integratieniveau](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Mate van functioneren](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Onderhoudsstatus](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Mailing List Manager met Yunohost installeren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Deze README in een andere taal lezen.](./ALL_README.md)*

> *Met dit pakket kun je Mailing List Manager snel en eenvoudig op een YunoHost-server installeren.*  
> *Als je nog geen YunoHost hebt, lees dan [de installatiehandleiding](https://yunohost.org/install), om te zien hoe je 'm installeert.*

## Overzicht

MLMMJ is a mailing list manager notable for its low memory and CPU footprint, requiring no database. Designed to be file-managed, MLMMJ lacks a native graphical interface, though independent graphical interfaces do exist.

In this YunoHost app, a configuration panel is provided in the webadmin (in the app's info page) and allows to configure settings such as:
- Subscription and posting policy
- Moderation options
- Customization of email subjects and footers.
- Add or remove subscribers

However for now, the package lacks:
- a web user interface to subscribe (for now people willing to subscribe should send an email to a special address, or ask admins to add them) 
- a web interface to browse the list's archive (but theoretically doable in the future)


**Geleverde versie:** 1.4.3~ynh2

## Schermafdrukken

![Schermafdrukken van Mailing List Manager](./doc/screenshots/panel.png)

## Documentatie en bronnen

- Officiele website van de app: <https://mlmmj.org/>
- Officiele beheerdersdocumentatie: <https://mlmmj.org/README.html>
- Upstream app codedepot: <https://codeberg.org/mlmmj/mlmmj>
- YunoHost-store: <https://apps.yunohost.org/app/mlmmj>
- Meld een bug: <https://github.com/YunoHost-Apps/mlmmj_ynh/issues>

## Ontwikkelaarsinformatie

Stuur je pull request alsjeblieft naar de [`testing`-branch](https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing).

Om de `testing`-branch uit te proberen, ga als volgt te werk:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
of
sudo yunohost app upgrade mlmmj -u https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
```

**Verdere informatie over app-packaging:** <https://yunohost.org/packaging_apps>
