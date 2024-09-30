<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# Mailing List Manager untuk YunoHost

[![Tingkat integrasi](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Status kerja](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Status pemeliharaan](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Pasang Mailing List Manager dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang Mailing List Manager secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

MLMMJ is a mailing list manager notable for its low memory and CPU footprint, requiring no database. Designed to be file-managed, MLMMJ lacks a native graphical interface, though independent graphical interfaces do exist.

In this YunoHost app, a configuration panel is provided in the webadmin (in the app's info page) and allows to configure settings such as:
- Subscription and posting policy
- Moderation options
- Customization of email subjects and footers.
- Add or remove subscribers

However for now, the package lacks:
- a web user interface to subscribe (for now people willing to subscribe should send an email to a special address, or ask admins to add them) 
- a web interface to browse the list's archive (but theoretically doable in the future)


**Versi terkirim:** 1.4.7~ynh1

## Tangkapan Layar

![Tangkapan Layar pada Mailing List Manager](./doc/screenshots/panel.png)

## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://mlmmj.org/>
- Dokumentasi admin resmi: <https://mlmmj.org/README.html>
- Depot kode aplikasi hulu: <https://codeberg.org/mlmmj/mlmmj>
- Gudang YunoHost: <https://apps.yunohost.org/app/mlmmj>
- Laporkan bug: <https://github.com/YunoHost-Apps/mlmmj_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
atau
sudo yunohost app upgrade mlmmj -u https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
