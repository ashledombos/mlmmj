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
# DECLARE DATA AND CONF FILES TO BACKUP
#=================================================
ynh_print_info --message="Declaring files to be backed up..."

### N.B. : the following 'ynh_backup' calls are only a *declaration* of what needs
### to be backuped and not an actual copy of any file. The actual backup that
### creates and fills the archive with the files happens in the core after this
### script is called. Hence ynh_backups calls take basically 0 seconds to run.

#=================================================
# BACKUP THE APP MAIN DIR
#=================================================

ynh_backup --src_path="$install_dir"

#=================================================
# BACKUP THE DATA DIRECTORY
#=================================================

ynh_backup --src_path="$data_dir" --is_big

# #=================================================
# # BACKUP FAIL2BAN CONFIGURATION
# #=================================================

# #ynh_backup --src_path="/etc/fail2ban/jail.d/$app.conf"
# #ynh_backup --src_path="/etc/fail2ban/filter.d/$app.conf"

#=================================================
# BACKUP THE CRON FILE
#=================================================

ynh_backup --src_path="$cron_file"

# #=================================================
# # SPECIFIC BACKUP
# #=================================================
# # BACKUP LOGROTATE
# #=================================================

# #ynh_backup --src_path="/etc/logrotate.d/$app"

#=================================================
# END OF SCRIPT
#=================================================

ynh_print_info --message="Backup script completed for $app. (YunoHost will then actually copy those files to the archive)."
