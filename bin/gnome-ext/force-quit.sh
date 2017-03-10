#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Adds XKill Icon to kill haning apps in top panel."

echo "(+) Setup: force-quit"

cd ~/.local/share/gnome-shell/extensions
git clone https://github.com/xtranophilist/gnome-shell-extension-force-quit.git
mv gnome-shell-extension-force-quit/ force-quit@xtranophilist

echo "(+) Installed: force-quit, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
