#!/bin/bash
# This should come first for PPA's
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sources=(numix)

echo "(+) Removing and Re-Adding Sources List"

for s in $sources; do
    if [ -f /etc/apt/sources.list.d/$s*ppa ]; then
        sudo rm /etc/apt/sources.list.d/$s*ppa
    fi
    sudo add-apt-repository -y ppa:$s
done

echo "(+) Updating Sources List"
echo "(+) Sources List Update Complete."

echo "(+) Installing Numix Theme (Use Tweak UI)."
sudo apt-get update
sudo apt-get install -y\
    numix-gtk-theme\
    numix-icon-theme\
    numix-icon-theme-circle

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

