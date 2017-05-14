#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Keys
echo "(+) Installing Composer"
curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "(+) Complete! Run with $ docker-compose"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
