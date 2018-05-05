#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi



echo "(+) Installing f.lux GUI for eye strain"
sudo add-apt-repository ppa:nathan-renniewaldock/flux -y
sudo apt-get update
sudo apt-get install fluxgui -y

echo "(+) Complete!"
echo "    Load flux from your applications panel."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
