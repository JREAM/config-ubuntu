#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# To see what you can change, run $ dconf
# Then navigation to the paths below.

# You can also use "get" rather than "set" without a value following it
# to see what exists.

gsettings set org.gnome.settings-daemon.plugins.media-keys email ""
gsettings set org.gnome.settings-daemon.plugins.media-keys www ""
gsettings set org.gnome.settings-daemon.plugins.media-keys home "<Super>e"


echo "(+) Hotkeys were Set."
echo "Email: disabled"
echo "WWW: disable"
echo "Home Folder: <Super>e"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

