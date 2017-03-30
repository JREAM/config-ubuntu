#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Keys
echo "(+) Installing Rocketeer"
wget http://rocketeer.autopergamene.eu/versions/rocketeer.phar
sudo chmod +x rocketeer.phar
sudo mv rocketeer.phar /usr/local/bin/rocketeer

echo "(+) Complete! Run with $ rocketeer"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
