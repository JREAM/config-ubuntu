#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Transform Gnome Shell's overview workspaces into an intelligent dock."
echo "(+) Setup: workspaces-to-dock"

cd ~
wget https://github.com/passingthru67/workspaces-to-dock/blob/releases/releases/master/31/workspaces-to-dock%40passingthru67.gmail.com.zip -O workspaces-to-dock.zip
unzip workspaces-to-dock.zip -d ~/.local/share/gnome-shell/extensions/workspaces-to-dock@passingthru67.gmail.com
rm workspaces-to-dock.zip

echo "(+) Installed: workspaces-to-dock, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
