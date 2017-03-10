#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Displays Internet Speed in top panel."

echo "(+) Setup: workspaces-to-dock"

cd ~
wget https://github.com/hedayaty/NetSpeed/archive/master.zip -O netspeed.zip
unzip netspeed.zip -d ~/.local/share/gnome-shell/extensions/netspeed@hedayaty.gmail.com
rm netspeed.zip

echo "(+) Installed: workspaces-to-dock, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
