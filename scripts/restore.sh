#!/bin/bash

#=================================================
# GENERIC START
#=================================================
# IMPORT GENERIC HELPERS
#=================================================

source /usr/share/yunohost/helpers

#=================================================
# DECLARE VARIABLES
#=================================================

# app=$YNH_APP_INSTANCE_NAME
# SPOOLDIR="/var/spool/mlmmj"
# LISTNAME=$(ynh_app_setting_get --app=$app --key=list_name)
# LISTDIR="$SPOOLDIR/$LISTNAME"
# CRON_FILE="/etc/cron.d/$app"
# ALIAS_FILE="/etc/aliases"

# #=================================================
# # RESTORE DATA DIRECTORY
# #=================================================

# ynh_print_info --message="Restoring mlmmj list directory..."

# # Remove existing directory if it exists
# ynh_secure_remove --file="$LISTDIR"

# # Restore the list directory from backup
# ynh_restore --src_path="$LISTDIR"

# #=================================================
# # RESTORE CRON FILE
# #=================================================

# ynh_print_info --message="Restoring mlmmj cron file..."
# ynh_restore --src_path="$CRON_FILE"

# #=================================================
# # RESTORE /etc/aliases
# #=================================================

# ynh_print_info --message="Updating /etc/aliases..."

# # Remove existing line for the list if it exists
# sed -i "/^$LISTNAME:/d" "$ALIAS_FILE"

# # Add the new alias line
# echo "$LISTNAME:     \"|/usr/local/bin/mlmmj-receive -L $LISTDIR\"" >> "$ALIAS_FILE"

# # Update aliases database
# newaliases

#=================================================
# END OF SCRIPT
#=================================================

ynh_print_info --message="Restore script completed for $app."
