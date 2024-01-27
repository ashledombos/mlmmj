#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================
# Install dir variables
src_dir="$install_dir/src"
app_dir="$install_dir/app"
tables_dir="$install_dir/tables"
transport_file="$tables_dir/transport"
virtual_file="$tables_dir/virtual"


# Data dir variables
control_dir="$data_dir/control"
subscribers_dir="$data_dir/subscribers.d"
ynh_dir="$data_dir/ynh"

# List email address variables
# local_part="${list_email%@*}"
# domain_part="${list_email#*@}"
local_part="toto"
domain_part="rototo"
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

#=================================================
# PERSONAL HELPERS
#=================================================
# install_update_mlmmj() {
#         ynh_print_info --message="Building mlmmj software"
#         ynh_install_app_dependencies autoconf make gcc pkg-config libatf-dev

#         [ ! -d "$src_dir" ] && mkdir -p "$src_dir"
#         [ ! -d "$app_dir" ] && mkdir -p "$app_dir"
        
#         ynh_setup_source  --full_replace --dest_dir="$src_dir" || ynh_die "Failed to download mlmmj"

#         chown $app:$app "$src_dir" "$app_dir" -R
#         pushd "$src_dir"

#         ynh_exec_and_print_stderr_only_if_error sudo -u $app autoreconf -i
#         ynh_exec_and_print_stderr_only_if_error sudo -u $app ./configure  --prefix="$app_dir"
#         ynh_exec_and_print_stderr_only_if_error sudo -u $app make
#         ynh_exec_and_print_stderr_only_if_error sudo -u $app make install
    
#         if [ $? -ne 0 ]; then
#             ynh_die "Failed to install mlmmj binaries"
#         fi
    
#         popd
#         ynh_add_config --template="regenconf_postfix" --destination="$regen_conf_file"
#         yunohost tools regen-conf postfix
# }
#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
