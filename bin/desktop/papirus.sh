#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
   echo "(!) Error: You must use the installer script."
   exit
fi

echo "(+) Adding Papirus PPA Icon Theme"
sudo add-apt-repository -y ppa:papirus/papirus

echo "(+) Installing Papirus-icon-theme"
sudo apt update && sudo apt install -y papirus-icon-theme


echo "(+) Complete! Open 'Tweak' to set your new icons'

if [ $SKIP_SLEEP == false ]; then
     sleep 4
fi

