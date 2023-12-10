#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================
# Global variables
MLMMJ_ROOT="/var/spool/mlmmj"
TABLES_DIR="$MLMMJ_ROOT/tables"
TRANSPORT_FILE="$TABLES_DIR/transport"
VIRTUAL_FILE="$TABLES_DIR/virtual"
symlink_dir="$MLMMJ_ROOT/$domain"
control_dir="$install_dir/control"
subscribers_dir="$install_dir/subscribers.d"

HOOK_DIR="/etc/yunohost/hooks.d/conf_regen"
TEMP_HOOK_PATH="$HOOK_DIR/99-install_mlmmj"

transport_entry="$app@localhost.mlmmj       mlmmj:$app"
virtual_entry="$list_name@$domain    $app@localhost.mlmmj"

CRON_DIR="/etc/cron.d/mlmmj"
cron_file="$CRON_DIR/$app.cron"
MLMMJRECEIVE="/usr/local/bin/mlmmj-receive"
MLMMJMAINTD="/usr/local/bin/mlmmj-maintd"

installed_version=""
REQUIRED_VERSION=$(cat mlmmj_version)

MLMMJ_SHARE="/usr/local/share/mlmmj"
lang_dir="$MLMMJ_SHARE/text.skel/$language"

#=================================================
# PERSONAL HELPERS
#=================================================
install_update_mlmmj() {
    local required_version=$1

    if command -v mlmmj-list >/dev/null 2>&1; then
        installed_version=$(mlmmj-list -V | cut -d ' ' -f3)
        ynh_script_progression --message="mlmmj is already installed with version: $installed_version"

        if [ "$required_version" != "$installed_version" ]; then
            ynh_script_progression --message="Updating mlmmj to the required version $required_version;"
        fi
    else
        ynh_script_progression --message="mlmmj is not installed, proceeding with installation;"
    fi

    if [ "$required_version" != "$installed_version" ]; then
        ynh_script_progression --message="Installing necessary packages"
        ynh_install_app_dependencies autoconf make gcc pkg-config libatf-dev
        ynh_script_progression --message="Downloading and installing mlmmj release"
        ynh_setup_source --dest_dir="mlmmj-latest" || ynh_die "Failed to download mlmmj"
        pushd mlmmj-latest
        autoreconf -i && ./configure && make && sudo make install || ynh_die "Failed to install mlmmj binaries"
        popd
    fi

    ynh_script_progression --message="Potfix setup"
    #! ls $HOOK_DIR/*-mlmmj 1> /dev/null 2>&1 &&
    cp ../hooks/conf_regen /usr/share/yunohost/hooks/conf_regen/98-mlmmj
    yunohost tools regen-conf
    rm -f /usr/share/yunohost/hooks/conf_regen/98-mlmmj
    #[ -f $TEMP_HOOK_PATH ] && rm $TEMP_HOOK_PATH

    ynh_script_progression --message="Setting ACLs"
    ynh_system_user_create --username=mlmmj_pfx

    
}
#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
