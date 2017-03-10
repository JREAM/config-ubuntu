#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y ubuntu-gnome-desktop gnome-session gnome-common

echo "(+) Gnome Complete! (You need to reboot)"
echo "(+) To re-configure your gdm/lightdm use: sudo dpkg-reconfigure gdm"
echo "(+) Use Gnome from the Screw Icon at your Login Screen"
echo "(+) For extensions use Firefox at: https://extensions.gnome.org"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

