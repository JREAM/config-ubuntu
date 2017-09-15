#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "(+) Complete! Run with $ node and $ npm"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
