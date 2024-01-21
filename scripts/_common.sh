#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================
# Global variables
tables_dir="$install_dir/tables"
transport_file="$tables_dir/transport"
virtual_file="$tables_dir/virtual"


control_dir="$data_dir/control"
subscribers_dir="$data_dir/subscribers.d"
ynh_dir="$data_dir/ynh"

transport_entry="$app@localhost.mlmmj       mlmmj:$app"
virtual_entry="$list_name@$list_domain    $app@localhost.mlmmj"

CRON_DIR="/etc/cron.d/mlmmj"
cron_file="$CRON_DIR/$app.cron"
MLMMJRECEIVE="/usr/local/bin/mlmmj-receive"
MLMMJMAINTD="/usr/local/bin/mlmmj-maintd"

installed_version=""
REQUIRED_VERSION=$(cat mlmmj_version)

MLMMJ_SHARE="/usr/local/share/mlmmj"
lang_dir="$MLMMJ_SHARE/text.skel/$language"

bin_dir=/usr/local/bin
sudoers_file="/etc/sudoers.d/mlmmj"
conf_dir="/etc/yunohost/apps/$app"

#=================================================
# PERSONAL HELPERS
#=================================================
install_update_mlmmj() {
        ynh_print_info --message="Building mlmmj software"
        ynh_install_app_dependencies autoconf make gcc pkg-config libatf-dev

        local src_dir="/var/www/$app/src"
        local app_dir="/var/www/$app/app"
        
        ynh_setup_source  --full_replace --dest_dir="$src_dir" || ynh_die "Failed to download mlmmj"

        chown $app:$app "$app_dir" -R
        pushd "$src_dir"

        ynh_exec_and_print_stderr_only_if_error sudo -u $app autoreconf -i
        ynh_exec_and_print_stderr_only_if_error sudo -u $app ./configure  --prefix="$app_dir"
        ynh_exec_and_print_stderr_only_if_error sudo -u $app make
        ynh_exec_and_print_stderr_only_if_error sudo -u $app make install
    
        if [ $? -ne 0 ]; then
            ynh_die "Failed to install mlmmj binaries"
        fi
    
        popd
        ynh_add_config --template="regenconf_postfix" --destination="/usr/share/yunohost/hooks/conf_regen/98-postfix_$app"
        yunohost tools regen-conf postfix
}
#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
