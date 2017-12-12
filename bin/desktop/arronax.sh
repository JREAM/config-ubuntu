#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing Arronax"

sudo add-apt-repository ppa:diesch/testing
sudo apt-get update
sudo apt-get install -y arronax
nautilus -q

# If error messages pop up after running the command
# sudo dpkg -i google-chrome*.deb then run the command
# sudo apt-get install -f

echo "(+) Complete! Create Launchers easily by loading Arronax from your applications"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
