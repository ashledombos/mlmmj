<!--
N.B.: This README is a simplified version adapted for the mlmmj package.
-->

# mlmmj for YunoHost

> *This package allows you to install mlmmj quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

mlmmj (Mailing List Manager Made Joyful) is a simple and efficient mailing list manager, inspired by the functionality of ezmlm. It integrates smoothly with mail servers like Postfix, offering features like automated bounce handling, custom headers/footers, moderation functionality, and more.

**Shipped version:** [latest version]

## Features

- Archive and automated bounce handling ;
- Custom headers/footers and complete requeueing functionality ;
- Moderation and subject prefix ;
- Subscriber-only posting and regular expression access control ;
- Web interface and digests support.

## Documentation and resources

* Official mlmmj website: <https://codeberg.org/mlmmj/mlmmj>
* Upstream app code repository: <https://codeberg.org/mlmmj/mlmmj>
* YunoHost documentation for this app: <https://yunohost.org/app_mlmmj>
* Report a bug: <https://github.com/YunoHost-Apps/mlmmj_ynh/issues>

## Developer info

Please send your pull requests to the [testing branch](https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing).

To try the testing branch, you can use the following commands:

``` bash
sudo yunohost app install https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
or
sudo yunohost app upgrade mlmmj -u https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>

---

This README provides a basic introduction to mlmmj and its integration with YunoHost. It can be expanded with additional details such as screenshots, detailed installation instructions, or any known limitations as you develop the package further.
