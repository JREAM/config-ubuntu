#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


sudo apt-get install -y chrome-gnome-shell

echo "(+) Complete! Open Chrome and install extensions at:"
echo "    https://extensions.gnome.org/local/"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
