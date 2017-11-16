#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Keys
echo "(+) Installing Capistrano"
sudo gem install capistrano

echo "(+) Complete! Run with $ capistrano"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
