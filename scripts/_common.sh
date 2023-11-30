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

POSTFIX_MASTER_CF="/etc/postfix/master.cf"
POSTFIX_MAIN_CF="/etc/postfix/main.cf"
MLMMJ_MASTER_STRING="# MLMMJ\nmlmmj   unix  -       n       n       -       -       pipe\n    flags=ORhu user=mlmmj_pfx argv=/usr/local/bin/mlmmj-receive -F -L /var/spool/mlmmj/files/\n"
MLMMJ_VIRTUAL_STRING=",hash:/var/spool/mlmmj/tables/virtual"
MLMMJ_TRANSPORT_STRING="# MLMMJ\ntransport_maps = hash:/var/spool/mlmmj/tables/transport\n"

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
    ynh_system_user_create --username=mlmmj_pfx
    sudo setfacl -R -m u:mlmmj_pfx:rwx /var/spool/mlmmj
    sudo setfacl -d -m u:mlmmj_pfx:rwx /var/spool/mlmmj
}

configure_postfix() {
    local need_reload=false

    if ! grep -q "$MLMMJ_MASTER_STRING" "$POSTFIX_MASTER_CF"; then
        echo "$MLMMJ_MASTER_STRING" >> "$POSTFIX_MASTER_CF"
        need_reload=true
    fi
    
    if ! grep -q "$MLMMJ_VIRTUAL_STRING" "$POSTFIX_MAIN_CF"; then
        sed -i "/^virtual_alias_maps = / s/$/ $MLMMJ_VIRTUAL_STRING/" "$POSTFIX_MAIN_CF"
        need_reload=true
    fi
    
    if ! grep -q "$MLMMJ_TRANSPORT_STRING" "$POSTFIX_MAIN_CF"; then
        echo "$MLMMJ_TRANSPORT_STRING" >> "$POSTFIX_MAIN_CF"
        need_reload=true
    fi

    [ "$need_reload" = true ] && systemctl reload postfix
}


remove_mlmmj () {
    sed -i "/$MLMMJ_MASTER_STRING/d" "$POSTFIX_MASTER_CF"
    
    sed -i "s/$MLMMJ_VIRTUAL_STRING//g" "$POSTFIX_MAIN_CF"
    
    sed -i "/$MLMMJ_TRANSPORT_STRING/d" "$POSTFIX_MAIN_CF"

    systemctl reload postfix
}
#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
