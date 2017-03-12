#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "An easier launching of applications and a faster switching between windows and desktops"
echo "(+) Setup: dash-to-dock"

cd ~
git clone https://github.com/micheleg/dash-to-dock.git
cd dash-to-dock
make
make install

rm -rf $HOME_PATH/dash-to-dock

echo "(+) Installed: dash-to-dock, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
