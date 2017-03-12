#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Bottom Dock similar to dash-to-dock (my preference)"

echo "(+) Setup: simple-dock"

cd ~
git clone https://github.com/optimisme/gnome-shell-simple-dock.git
cd gnome-shell-simple-dock
chmod 744 install.sh
./install.sh

rm -rf $HOME_PATH/gnome-shell-simple-dock

echo "(+) Installed: gnome-shell-simple-dock, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
