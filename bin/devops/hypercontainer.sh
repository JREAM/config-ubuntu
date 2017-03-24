#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Keys
echo "(+) Downloading Installer"
curl -sSL https://hypercontainer.io/install | bash


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
