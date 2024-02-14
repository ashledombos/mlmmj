1. **Gestion Limitée via le Panneau de Configuration** :
   Toutes les options configurables (TUNABLES) de MLMMJ ne sont pas modifiables directement via le panneau de configuration de Yunohost. Pour une liste complète des options et des fonctionnalités avancées, consultez la documentation des TUNABLES sur [Codeberg MLMMJ TUNABLES](https://codeberg.org/mlmmj/mlmmj/src/branch/master/documentation/tunables.text). 

2. **Modification Directe des Fichiers de Configuration** :
   Les noms des fichiers de configuration correspondants sont fournis pour permettre la modification soit via le panneau de contrôle, soit directement via les fichiers TUNABLES. Cette flexibilité est importante pour les administrateurs souhaitant personnaliser davantage la configuration de leurs listes de diffusion. Sur ce serveur, les fichiers sont situés dans le répertoire `__INSTALL_DIR__/config`

3. **Ajout d'Abonnés** :
   Les administrateurs peuvent ajouter des abonnés aux listes de diffusion à travers le panneau de configuration de Yunohost. En outre, les commandes MLMMJ sont disponibles pour gérer les abonnés. Veuillez noter que l'utilisation des commandes MLMMJ requiert actuellement des droits sudo.
   Pour gérer les abonnements, les commandes suivantes mlmmj-sub, mlmmj-unsub et mlmmj-list peuvent être utilisées pour respectivement abonnner, désabonner ou lister les abonnements.
   Le chemin complet des listes est nécessaire pour utiliser ces commandes. Pour plus d’aide sur ces commandes, exécutez les commandes avec l’option -h :
   * sudo /usr/local/bin/mlmmj-sub -L __INSTALL_DIR__ -h
   * sudo /usr/local/bin/mlmmj-unsub -L __INSTALL_DIR__ -h
   * sudo /usr/local/bin/mlmmj-list -L __INSTALL_DIR__ -h
  
  Exemple de commande : abonner l’adresse nom@domaine.com :
sudo /usr/local/bin/mlmmj-sub -L __INSTALL_DIR__ -a nom@domaine.com
  
Pour les administrateurs souhaitant une personnalisation et une gestion avancées de MLMMJ au-delà de l'interface utilisateur de Yunohost, il est recommandé de se familiariser avec les fichiers de configuration et les commandes MLMMJ.


