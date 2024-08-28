<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 Mailing List Manager

[![集成程度](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![工作状态](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![维护状态](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![使用 YunoHost 安装 Mailing List Manager](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 Mailing List Manager。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

MLMMJ is a mailing list manager notable for its low memory and CPU footprint, requiring no database. Designed to be file-managed, MLMMJ lacks a native graphical interface, though independent graphical interfaces do exist.

In this YunoHost app, a configuration panel is provided in the webadmin (in the app's info page) and allows to configure settings such as:
- Subscription and posting policy
- Moderation options
- Customization of email subjects and footers.
- Add or remove subscribers

However for now, the package lacks:
- a web user interface to subscribe (for now people willing to subscribe should send an email to a special address, or ask admins to add them) 
- a web interface to browse the list's archive (but theoretically doable in the future)


**分发版本：** 1.4.3~ynh2

## 截图

![Mailing List Manager 的截图](./doc/screenshots/panel.png)

## 文档与资源

- 官方应用网站： <https://mlmmj.org/>
- 官方管理文档： <https://mlmmj.org/README.html>
- 上游应用代码库： <https://codeberg.org/mlmmj/mlmmj>
- YunoHost 商店： <https://apps.yunohost.org/app/mlmmj>
- 报告 bug： <https://github.com/YunoHost-Apps/mlmmj_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
或
sudo yunohost app upgrade mlmmj -u https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
