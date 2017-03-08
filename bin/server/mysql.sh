#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y\
    mysql-server\
    mysql-client\
    mysql-utilities

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Installed MySQL Utilities."
echo "    MySQL Server, Client, Utilities"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
