#!/bin/bash

#=================================================
# INSTALL
#=================================================

# Import YunoHost helpers
source /usr/share/yunohost/helpers
source _common.sh

# -------------------------------------------------------------
# Check list email address validity
# -------------------------------------------------------------

ynh_script_progression --message="Check name validity;" -t

is_valid_list_email() {
    local email_address="$1"

    # Vérifie si l'adresse est déjà l'adresse principale d'un utilisateur
    local primary_email_user=$(sudo yunohost user list --output-as json | jq -r --arg email "$email_address" '.users | to_entries[] | select(.value.mail == $email) | .key')
    if [[ -n "$primary_email_user" ]]; then
        ynh_print_err --message="The email address '$email_address' is already the primary email of user '$primary_email_user'. Please choose a different email address."
        return 1
    fi

    # Vérifie si l'adresse est déjà un alias d'un utilisateur
    local email_alias_user=$(sudo yunohost user list --fields mail-alias --output-as json | jq -r --arg email "$email_address" '.users | to_entries[] | select(.value["mail-alias"] | index($email)) | .key')
    if [[ -n "$email_alias_user" ]]; then
        ynh_print_err --message="The email address '$email_address' is already an alias of user '$email_alias_user'. Please choose a different email address."
        return 1
    fi

    return 0
}

is_domain_managed_by_yunohost() {
    local list_domain=$1

    # Check if domain exist in Yunohost instance
    if ! yunohost domain list --output-as json | jq -r '.domains[]' | grep -q "^$list_domain$"; then
        ynh_print_err --message="The domain '$list_domain' is not managed by this Yunohost instance."
        return 1
    fi
}


is_domain_mail_set() {
    local list_domain=$1
    
    # Get mail_in and mail_out settings for the domain
    local incoming_mail_enabled=$(sudo yunohost domain config get $list_domain feature.mail.mail_in)
    local outgoing_mail_enabled=$(sudo yunohost domain config get $list_domain feature.mail.mail_out)

    # Check if both mail_in and mail_out are enabled
    if [[ $incoming_mail_enabled != "1" || $outgoing_mail_enabled != "1" ]]; then
        ynh_print_err --message="Mail in and mail out not activated for $list_domain"
        return 1
    fi

    return 0
}

if ! is_valid_list_email "$list_email"; then
    ynh_die --message="Please choose an available email address"
else
    ynh_print_info --message="The domain '$domain_part' is correctly set up with mail in and mail out."
fi

if ! is_domain_managed_by_yunohost "$domain_part"; then
    ynh_die --message="Please add $domain_part in this Yunohost instance domains list."
else
    ynh_print_info --message="The domain '$domain_part' is managed by this Yunohost instance."
fi

if ! is_domain_mail_set "$domain_part"; then
    ynh_die --message="Please activate mail in and mail out for the domain $domain_part."
else
    ynh_print_info --message="The domain '$domain_part' is correctly set up with mail in and mail out."
fi

# -------------------------------------------------------------
# Install MLMMJ if necessary and check Postfix
# -------------------------------------------------------------


ynh_script_progression --message="Source download and binaries compilation;" --weight=5 --time

install_update_mlmmj
# install_update_mlmmj "$app_version"

# -------------------------------------------------------------
# Mailing List Creation and Activation
# -------------------------------------------------------------

ynh_script_progression --message="Creating the list $list_email at $data_dir;" --time

if [ -d "$lang_dir" ]; then
    cp "$lang_dir"/* "$data_dir/text"
fi

# -------------------------------------------------------------
# Setting up conf files transport et virtual
# -------------------------------------------------------------

[ ! -d "$tables_dir" ] && mkdir -p "$tables_dir"

[ ! -f "$transport_file" ] && touch "$transport_file"
[ ! -f "$virtual_file" ] && touch "$virtual_file"

if ! grep -qF "$transport_entry" "$transport_file"; then
    echo "$transport_entry" >> "$transport_file"
    postmap "$transport_file"
fi

if ! grep -qF "$virtual_entry" "$virtual_file"; then
    echo "$virtual_entry" >> "$virtual_file"
    postmap "$virtual_file"
fi

chgrp postfix $install_dir
chown $app:postfix $install_dir/tables -R

# -------------------------------------------------------------
# Cron
# -------------------------------------------------------------

rand_min=$(shuf -i 0-59 -n 1) # Generate random minute execution (between 0 and 59)
# if [ ! -d "$CRON_DIR" ]; then
#     mkdir -p "$CRON_DIR"
#     chmod 644 "$CRON_DIR"
# fi
echo "$rand_min */2 * * * $app $mlmmjmaintd -F -L $data_dir" > "$cron_file" 

# -------------------------------------------------------------
# Default settings
# -------------------------------------------------------------

ynh_app_setting_set -a $app -k category -v "subscribers"
ynh_app_setting_set -a $app -k display_subscribers -v false
ynh_app_setting_set -a $app -k display_digesters -v false
ynh_app_setting_set -a $app -k display_nomailsubs -v false

touch "$control_dir/moderators"
touch "$control_dir/subonlypost"
echo "[$local_part]" > "$control_dir/prefix"
touch "$data_dir/control/owner"
touch "$control_dir/notifysub"
touch "$control_dir/subonlyget"
echo "postfix" > "$control_dir/verp"
touch "$control_dir/nodigestsub"
touch "$control_dir/nonomailsub"
echo "10485760" > "$control_dir/maxmailsize"  # 10MB
touch $data_dir/ynh/moderators.txt
touch $data_dir/ynh/submod.txt
touch $data_dir/ynh/subscribers.txt
touch $data_dir/ynh/digesters.txt
touch $data_dir/ynh/nomailsubs.txt

[ -f "../conf/footer_${language}.tpl" ] && footer_template="footer_${language}.tpl" || footer_template="footer_en.tpl"
ynh_add_config --template="$footer_template" --destination="$control_dir/footer"

echo "$(yunohost user info "$owner" --output-as plain | awk '/^#mail/ { getline; print $1; exit }')" | tee "$data_dir/control/owner" > "$data_dir/ynh/owner.txt"
echo "$list_email" > "$data_dir/control/listaddress"


# -------------------------------------------------------------
# Install completion
# -------------------------------------------------------------

ynh_script_progression --message="Mailing list $list_email was created successfully." --last
