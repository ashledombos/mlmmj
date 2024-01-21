#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================
# Global variables
SPOOL_DIR="/var/spool/mlmmj"
ETC_DIR="/usr/local/etc/mlmmj"
TRANSPORT_FILE="$ETC_DIR/transport"
VIRTUAL_FILE="$ETC_DIR/virtual"
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
    local required_version=$1

    if command -v mlmmj-list >/dev/null 2>&1; then
        installed_version=$(mlmmj-list -V | cut -d ' ' -f3)

        if [ "$required_version" != "$installed_version" ]; then
            ynh_print_info --message="Updating mlmmj from $installed_version to $required_version;"
        else 
            ynh_print_info --message="mlmmj is already installed with version: $installed_version"
        fi
    else
        ynh_print_info --message="mlmmj is not installed, proceeding with installation;"
    fi

    if [ "$required_version" != "$installed_version" ]; then
        ynh_print_info --message="Building mlmmj software"
        ynh_install_app_dependencies autoconf make gcc pkg-config libatf-dev
    
        ynh_setup_source --dest_dir="mlmmj-latest" || ynh_die "Failed to download mlmmj"
        pushd mlmmj-latest
    
        ynh_exec_and_print_stderr_only_if_error autoreconf -i
        ynh_exec_and_print_stderr_only_if_error ./configure
        ynh_exec_and_print_stderr_only_if_error make
        ynh_exec_and_print_stderr_only_if_error sudo make install
    
        if [ $? -ne 0 ]; then
            ynh_die "Failed to install mlmmj binaries"
        fi
    
        popd
        ynh_add_config --template="regenconf_postfix" --destination="/usr/share/yunohost/hooks/conf_regen/98-postfix_mlmmj"
        yunohost tools regen-conf postfix
    fi


    #ynh_system_user_create --username=mlmmj_pfx

    
}
#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
