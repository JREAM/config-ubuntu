#!/bin/bash
# This should come first for PPA's
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

SOURCES=(xenlism)

echo "(+) Removing and Re-Adding SOURCES List"

for s in $SOURCES; do
    if [ -f /etc/apt/SOURCES.list.d/$s*ppa ]; then
        sudo rm /etc/apt/SOURCES.list.d/$s*ppa
    fi
    sudo add-apt-repository -y ppa:xenatt/$s
done

echo "(+) Updating SOURCES List"
echo "(+) SOURCES List Update Complete."

echo "(+) Installing Xenlism Theme (Use Tweak UI)."
sudo apt-get update
sudo apt-get install -y\
    xenlism-finewalls\
    xenlism-minimalism-theme\
    xenlism-storm\
    xenlism-wildfire-icon-theme

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
