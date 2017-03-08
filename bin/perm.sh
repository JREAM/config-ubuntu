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

echo "(+) Changing /usr/local permissions to: g+rws"
sudo chmod -R g+rws /usr/local

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
