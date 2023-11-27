ynh_script_progression --message="Checking existing mlmmj binaries;"
INSTALLED_VERSION=""

if command -v mlmmj-list >/dev/null 2>&1; then
    INSTALLED_VERSION=$(mlmmj-list -V | cut -d ' ' -f3)
    ynh_script_progression --message="mlmmj is already installed with version: $INSTALLED_VERSION"    
    if [ "$REQUIRED_VERSION" != "$INSTALLED_VERSION" ]; then
        ynh_script_progression --message="Updating mlmmj to the required version;"
    fi
else
    ynh_script_progression --message="mlmmj is not installed, proceeding with installation;" -t
fi

if [ "$REQUIRED_VERSION" != "$INSTALLED_VERSION" ]; then
    ynh_script_progression --message="Installing necessary packages" -t -w 5
    ynh_install_app_dependencies autoconf make gcc pkg-config libatf-dev
    ynh_script_progression --message="Downloading and installing mlmmj release;" -t
    ynh_setup_source --dest_dir="mlmmj-latest"|| ynh_die "Failed to download mlmmj"
    pushd mlmmj-latest
    autoreconf -i && ./configure && make && sudo make install || ynh_die "Failed to install mlmmj binaries"
    popd
    ynh_secure_remove mlmmj-latest
fi
