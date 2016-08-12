#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# Create user Permissions for usr/local
sudo groupadd local
sudo usermod -a -G local $USER
sudo usermod -a -G www-data $USER
sudo chgrp -R local /usr/local
sudo chmod -R g+rwx /usr/local