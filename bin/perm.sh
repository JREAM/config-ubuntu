#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Create user Permissions for usr/local
echo "(+) Adding Group: staff"
sudo groupadd staff

echo "(+) Adding $USER to Group: staff"
sudo usermod -aG staff $USER

echo "(+) Changing /usr/local group to: staff"
sudo chgrp -R staff /usr/local

echo "(+) Changing /usr/local permissions to: g+rwx"
sudo chmod -R g+rwx /usr/local

sleep 4
