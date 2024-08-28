<!--
Важно: этот README был автоматически сгенерирован <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Он НЕ ДОЛЖЕН редактироваться вручную.
-->

# Mailing List Manager для YunoHost

[![Уровень интеграции](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Состояние работы](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Состояние сопровождения](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Установите Mailing List Manager с YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Прочтите этот README на других языках.](./ALL_README.md)*

> *Этот пакет позволяет Вам установить Mailing List Manager быстро и просто на YunoHost-сервер.*  
> *Если у Вас нет YunoHost, пожалуйста, посмотрите [инструкцию](https://yunohost.org/install), чтобы узнать, как установить его.*

## Обзор

MLMMJ is a mailing list manager notable for its low memory and CPU footprint, requiring no database. Designed to be file-managed, MLMMJ lacks a native graphical interface, though independent graphical interfaces do exist.

In this YunoHost app, a configuration panel is provided in the webadmin (in the app's info page) and allows to configure settings such as:
- Subscription and posting policy
- Moderation options
- Customization of email subjects and footers.
- Add or remove subscribers

However for now, the package lacks:
- a web user interface to subscribe (for now people willing to subscribe should send an email to a special address, or ask admins to add them) 
- a web interface to browse the list's archive (but theoretically doable in the future)


**Поставляемая версия:** 1.4.3~ynh2

## Снимки экрана

![Снимок экрана Mailing List Manager](./doc/screenshots/panel.png)

## Документация и ресурсы

- Официальный веб-сайт приложения: <https://mlmmj.org/>
- Официальная документация администратора: <https://mlmmj.org/README.html>
- Репозиторий кода главной ветки приложения: <https://codeberg.org/mlmmj/mlmmj>
- Магазин YunoHost: <https://apps.yunohost.org/app/mlmmj>
- Сообщите об ошибке: <https://github.com/YunoHost-Apps/mlmmj_ynh/issues>

## Информация для разработчиков

Пришлите Ваш запрос на слияние в [ветку `testing`](https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing).

Чтобы попробовать ветку `testing`, пожалуйста, сделайте что-то вроде этого:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
или
sudo yunohost app upgrade mlmmj -u https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
```

**Больше информации о пакетировании приложений:** <https://yunohost.org/packaging_apps>
