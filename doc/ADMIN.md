1. **Limited Management via Configuration Panel**:
   Not all configurable options (TUNABLES) of MLMMJ are directly editable through the Yunohost configuration panel. For a complete list of options and advanced features, consult the TUNABLES documentation on [Codeberg MLMMJ TUNABLES](https://codeberg.org/mlmmj/mlmmj/src/branch/master/documentation/tunables.text).

2. **Direct Modification of Configuration Files**:
   The names of the corresponding configuration files are provided to allow modifications either via the control panel or directly through the TUNABLES files. This flexibility is important for administrators who wish to further customize the configuration of their mailing lists. On this server, the files are located in the `__INSTALL_DIR__/config` directory.

3. **Adding Subscribers**:
   Administrators can add subscribers to mailing lists through the Yunohost configuration panel. Additionally, MLMMJ commands are available to manage subscribers. Note that using MLMMJ commands currently requires sudo rights.
   To manage subscriptions, the following commands mlmmj-sub, mlmmj-unsub, and mlmmj-list can be used to subscribe, unsubscribe, or list subscriptions, respectively.
   The full path of the lists is required to use these commands. For more help on these commands, run the commands with the -h option:
   * sudo /usr/local/bin/mlmmj-sub -L __INSTALL_DIR__ -h
   * sudo /usr/local/bin/mlmmj-unsub -L __INSTALL_DIR__ -h
   * sudo /usr/local/bin/mlmmj-list -L __INSTALL_DIR__ -h

   Example command to subscribe the address nom@domaine.com:
   sudo /usr/local/bin/mlmmj-sub -L __INSTALL_DIR__ -a nom@domaine.com

For administrators seeking advanced customization and management of MLMMJ beyond the Yunohost user interface, it is recommended to familiarize themselves with the configuration files and MLMMJ commands.
