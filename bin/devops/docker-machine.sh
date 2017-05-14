#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Keys
echo "(+) Installing Docker Machine"
curl -L https://github.com/docker/machine/releases/download/v0.11.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine

echo "(+) Complete! Run with $ docker-machine"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
