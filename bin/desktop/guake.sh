#!/bin/bash
# This should come first for PPA's
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Guake."
sudo apt-get install -y guake

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

