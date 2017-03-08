#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y\
    redis-server

echo "(+) Complete! Connect with $ redis-cli"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
