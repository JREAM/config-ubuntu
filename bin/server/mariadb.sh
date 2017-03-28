#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Downloading and installing Maria DB"

sudo apt-get -y install mariadb-server mariadb-client

echo "(+) Complete! Maria DB Installed."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
