<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# Mailing List Manager pour YunoHost

[![Niveau d’intégration](https://dash.yunohost.org/integration/mlmmj.svg)](https://ci-apps.yunohost.org/ci/apps/mlmmj/) ![Statut du fonctionnement](https://ci-apps.yunohost.org/ci/badges/mlmmj.status.svg) ![Statut de maintenance](https://ci-apps.yunohost.org/ci/badges/mlmmj.maintain.svg)

[![Installer Mailing List Manager avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mlmmj)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer Mailing List Manager rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

MLMMJ est un gestionnaire de listes de discussion qui se distingue par sa faible empreinte mémoire et CPU, sans nécessiter de base de données. Conçu pour être géré par fichiers, MLMMJ n'a pas d'interface graphique propre. Toutefois, certaines interfaces graphiques existent en développement indépendant.

Dans cette app YunoHost, une interface de configuration est fournie dans la webadmin (dans la page d'infos de l'app) et permet de configurer les paramètres tels que:
- La politique d'inscription et d'envoi de messages
- Les options de modération
- La personnalisation des objets et pieds de page des emails.
- Ajouter / enlever des abonné·e·s

Néanmoins pour le moment l'application ne dispose pas :
- d'une interface web pour s'inscrire à la liste (pour le moment les pesonnes souhaitant s'inscrire doivent envoyer un mail à une adresse spéciale, ou demander à un·e admin de les ajouter)
- d'une interface web pour naviguer dans les archives (mais théoriquement faisable dans le futur)


**Version incluse :** 1.4.3~ynh2

## Captures d’écran

![Capture d’écran de Mailing List Manager](./doc/screenshots/panel.png)

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
