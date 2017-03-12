#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "A replacement for Alt-Tab, cycles through apps on current workspace only."
echo "(+) Setup: alt-tab-workspace"

cd ~
wget https://github.com/kwalo/gnome-shell-alt-tab-workspace/archive/master.zip -O alt-tab-workspace.zip
unzip alt-tab-workspace.zip
mv alt-tab-workspace/alt-tab-workspace@kwalo.net ~/.local/share/gnome-shell/extensions
rm alt-tab-workspace.zip

echo "(+) Installed: alt-tab-workspace, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
