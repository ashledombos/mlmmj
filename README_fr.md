<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# mlmmj pour YunoHost

[![Niveau d’intégration](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Statut du fonctionnement](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Statut de maintenance](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Installer mlmmj avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer mlmmj rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble



MLMMJ est un gestionnaire de listes de discussion qui se distingue par sa faible empreinte mémoire et CPU, sans nécessiter de base de données. Conçu pour être géré par fichiers, MLMMJ n'a pas d'interface graphique propre. Toutefois, certaines interfaces graphiques existent en développement indépendant. Avec Yunohost, l'objectif est de faciliter la gestion complète via son panneau de configuration.

Le package MLMMJ de Yunohost, est pré-configuré pour l’environnement de messagerie électronique de Yunohost. Il intègre de nombreuses fonctionnalités clés de MLMMJ dans un panneau de configuration pratique. Parmi les fonctionnalités notables, on retrouve :

* La gestion des processus d'abonnement et de désabonnement.
* Les options pour la modération de liste et le mode résumé (digest).
* La personnalisation des objets et pieds de page des emails.
* Les paramètres d’archivage.
* …

Pour des fonctionnalités spécifiques non couvertes dans le panneau de configuration, les utilisateurs sont encouragés à [ouvrir une demande](https://github.com/YunoHost-Apps/mlmmj_ynh/issues) sur la page GitHub du package Yunohost, favorisant le développement continu et la personnalisation pour répondre aux divers besoins des utilisateurs. 



**Version incluse :** 1.4.3~ynh1

## Captures d’écran

![Capture d’écran de mlmmj](./doc/screenshots/panel.png)

## Documentations et ressources

- Site officiel de l’app : <https://mlmmj.org/>
- Documentation officielle de l’admin : <https://mlmmj.org/README.html>
- Dépôt de code officiel de l’app : <https://codeberg.org/mlmmj/mlmmj>
- YunoHost Store : <https://apps.yunohost.org/app/mlmmj>
- Signaler un bug : <https://github.com/YunoHost-Apps/mlmmj_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mlmmj -u https://github.com/YunoHost-Apps/mlmmj_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
