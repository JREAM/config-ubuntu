#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Adding PPA"
sudo add-apt-repository -y ppa:atareao/atareao
sudo apt-get update

echo "(+) Installing touchpad-indicator"
sudo apt-get install -y touchpad-indicator

echo "(+) Complete. Load the program and update your settings."
echo "    Higly recommended to reboot."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

