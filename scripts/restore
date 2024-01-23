#!/bin/bash

#=================================================
# GENERIC START
#=================================================
# IMPORT GENERIC HELPERS
#=================================================

# Keep this path for calling _common.sh inside the execution's context of backup and restore scripts
source ../settings/scripts/_common.sh
source /usr/share/yunohost/helpers

#=================================================
# RESTORE THE APP MAIN DIR
#=================================================
ynh_script_progression --message="Restoring the app main directory..." --weight=1

ynh_restore_file --origin_path="$install_dir"

### $install_dir will automatically be initialized with some decent
### permissions by default ... however, you may need to recursively reapply
### ownership to all files such as after the ynh_setup_source step
# chown -R "$app:www-data" "$install_dir"

#=================================================
# RESTORE THE DATA DIRECTORY
#=================================================
ynh_script_progression --message="Restoring the data directory..." --weight=1

ynh_restore_file --origin_path="$data_dir" --not_mandatory

### (Same as for install dir)
# chown -R "$app:www-data" "$data_dir"

#=================================================
# RESTORE SYSTEM CONFIGURATIONS
#=================================================
ynh_script_progression --message="Restoring system configurations related to $app..." --weight=1

### This should be a symetric version of what happens in the install script

ynh_restore_file --origin_path="/etc/php/$phpversion/fpm/pool.d/$app.conf"

ynh_restore_file --origin_path="/etc/nginx/conf.d/$domain.d/$app.conf"

ynh_restore_file --origin_path="/etc/systemd/system/$app.service"
systemctl enable "$app.service" --quiet

yunohost service add "$app" --description="A short description of the app" --log="/var/log/$app/$app.log"

ynh_restore_file --origin_path="/etc/logrotate.d/$app"

ynh_restore_file --origin_path="/etc/fail2ban/jail.d/$app.conf"
ynh_restore_file --origin_path="/etc/fail2ban/filter.d/$app.conf"
ynh_systemd_action --action=restart --service_name=fail2ban

#=================================================
# RESTORE VARIOUS FILES
#=================================================

ynh_restore_file --origin_path="$cron_file"

### For apps with huge logs, you might want to not backup logs every time:
### The mkdir call is just here in case the log directory was not backed up.
### mkdir -p "/var/log/$app"
### chown $app:www-data "/var/log/$app"
### ynh_restore_file --src_path="/var/log/$app/" --not_mandatory
###
### For other apps, the simple way is better:
ynh_restore_file --origin_path="/var/log/$app/"

#=================================================
# GENERIC FINALIZATION
#=================================================
# RELOAD NGINX AND PHP-FPM OR THE APP SERVICE
#=================================================
ynh_script_progression --message="Reloading NGINX web server..." --weight=1

ynh_systemd_action --service_name=nginx --action=reload

# -------------------------------------------------------------
# Create symlinks in /var/spool/dir to keep usual organization
# -------------------------------------------------------------

[ ! -d "$SPOOL_DIR" ] && mkdir -p "$SPOOL_DIR"
ln -s $data_dir $install_dir/$list_name
ln -s $data_dir $SPOOL_DIR/$list_name

# -------------------------------------------------------------
# Setting up conf files transport et virtual
# -------------------------------------------------------------

[ ! -d "$ETC_DIR" ] && mkdir -p "$ETC_DIR"

[ ! -f "$TRANSPORT_FILE" ] && touch "$TRANSPORT_FILE"
[ ! -f "$VIRTUAL_FILE" ] && touch "$VIRTUAL_FILE"

if ! grep -qF "$transport_entry" "$TRANSPORT_FILE"; then
    echo "$transport_entry" >> "$TRANSPORT_FILE"
    postmap "$TRANSPORT_FILE"
fi

if ! grep -qF "$virtual_entry" "$VIRTUAL_FILE"; then
    echo "$virtual_entry" >> "$VIRTUAL_FILE"
    postmap "$VIRTUAL_FILE"
fi

#=================================================
# END OF SCRIPT
#=================================================

ynh_script_progression --message="Restoration completed for $app" --last
