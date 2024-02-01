#!/bin/bash

# #=================================================
# # COMMON VARIABLES
# #=================================================
# Install dir variables
src_dir="$install_dir/src"
app_dir="$install_dir/app"
tables_dir="$install_dir/tables"
transport_file="$tables_dir/transport"
virtual_file="$tables_dir/virtual"


# Data dir variables
control_dir="$data_dir/control"
subscribers_dir="$data_dir/subscribers.d"
ynh_dir="$install_dir/ynh"

# List email address variables
local_part="${list_email%@*}"
domain_part="${list_email#*@}"
transport_entry="$app@localhost.mlmmj       mlmmj:$app"
virtual_entry="$list_email    $app@localhost.mlmmj"

cron_file="/etc/cron.d/$app.cron"
mlmmjreceive="$install_dir/app/bin/mlmmj-receive"
mlmmjmaintd="$install_dir/app/bin/mlmmj-maintd"
regen_conf_file="/usr/share/yunohost/hooks/conf_regen/98-postfix_$app"

# installed_version=""
# REQUIRED_VERSION=$(cat mlmmj_version)
# app_version="${version%%~*}"

mlmmj_share="$install_dir/app/share"
lang_dir="$mlmmj_share/text.skel/$language"

app_password=$(openssl rand -base64 12)

#=================================================
# PERSONAL HELPERS
#=================================================
install_update_mlmmj() {
        ynh_print_info --message="Building mlmmj software"
        ynh_install_app_dependencies autoconf make gcc pkg-config libatf-dev

        [ ! -d "$src_dir" ] && mkdir -p "$src_dir"
        [ ! -d "$app_dir" ] && mkdir -p "$app_dir"
        
        ynh_setup_source  --full_replace --dest_dir="$src_dir" || ynh_die "Failed to download mlmmj"

        chown $app:$app "$src_dir" "$app_dir" -R
        pushd "$src_dir"

        ynh_exec_and_print_stderr_only_if_error sudo -u $app autoreconf -i
        ynh_exec_and_print_stderr_only_if_error sudo -u $app ./configure  --prefix="$app_dir"
        ynh_exec_and_print_stderr_only_if_error sudo -u $app make
        ynh_exec_and_print_stderr_only_if_error sudo -u $app make install
    
        if [ $? -ne 0 ]; then
            ynh_die "Failed to install mlmmj binaries"
        fi
    
        popd
}

is_valid_list_email() {
    local email_address="$1"

    local primary_email_user=$(sudo yunohost user list --output-as json | jq -r --arg email "$email_address" '.users | to_entries[] | select(.value.mail == $email) | .key')
    if [[ -n "$primary_email_user" ]]; then
        ynh_print_err --message="The email address '$email_address' is already the primary email of user '$primary_email_user'. Please choose a different email address."
        return 1
    fi

    local email_alias_user=$(sudo yunohost user list --fields mail-alias --output-as json | jq -r --arg email "$email_address" '.users | to_entries[] | select(.value["mail-alias"] | index($email)) | .key')
    if [[ -n "$email_alias_user" ]]; then
        ynh_print_err --message="The email address '$email_address' is already an alias of user '$email_alias_user'. Please choose a different email address."
        return 1
    fi

    return 0
}

is_domain_managed_by_yunohost() {
    local list_dom=$1

    if ! yunohost domain list --output-as json | jq -r '.domains[]' | grep -q "^$list_dom$"; then
        ynh_print_err --message="The domain '$list_dom' is not managed by this Yunohost instance."
        return 1
    fi
}

is_domain_mail_set() {
    local list_dom=$1

    local incoming_mail_enabled=$(sudo yunohost domain config get $list_dom feature.mail.mail_in)
    local outgoing_mail_enabled=$(sudo yunohost domain config get $list_dom feature.mail.mail_out)

    if [[ $incoming_mail_enabled != "1" && $outgoing_mail_enabled != "1" ]]; then
        ynh_print_err --message="Both mail in and mail out are not activated for $list_dom"
        return 1
    elif [[ $incoming_mail_enabled != "1" ]]; then
        ynh_print_err --message="Mail in is not activated for $list_dom"
        return 1
    elif [[ $outgoing_mail_enabled != "1" ]]; then
        ynh_print_err --message="Mail out is not activated for $list_dom"
        return 1
    fi

    return 0
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
