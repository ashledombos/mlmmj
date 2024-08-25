<!--
Важно: этот README был автоматически сгенерирован <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Он НЕ ДОЛЖЕН редактироваться вручную.
-->

# mlmmj для YunoHost

[![Уровень интеграции](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Состояние работы](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Состояние сопровождения](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Установите mlmmj с YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Прочтите этот README на других языках.](./ALL_README.md)*

> *Этот пакет позволяет Вам установить mlmmj быстро и просто на YunoHost-сервер.*  
> *Если у Вас нет YunoHost, пожалуйста, посмотрите [инструкцию](https://yunohost.org/install), чтобы узнать, как установить его.*

## Обзор

MLMMJ is a mailing list manager notable for its low memory and CPU footprint, requiring no database. Designed to be file-managed, MLMMJ lacks a native graphical interface, though independent graphical interfaces do exist. With Yunohost, the aim is to enable comprehensive management through its configuration panel.

The Yunohost MLMMJ package is pre-configured for Yunohost's email environment. It integrates many key MLMMJ features into a user-friendly configuration panel, including:

* Subscription and unsubscription processes.
* List moderation options and digest mode.
* Customization of email subjects and footers.
* Archiving settings.
* ...

For specific functionalities not covered in the panel, users are encouraged to [open a request](https://github.com/YunoHost-Apps/mlmmj_ynh/issues) on the package's GitHub page, fostering continuous development and customization.


**Поставляемая версия:** 1.4.3~ynh1

## Снимки экрана

![Снимок экрана mlmmj](./doc/screenshots/panel.png)

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
