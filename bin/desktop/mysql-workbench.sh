#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y\
    mysql-workbench

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Installed MySQL Workbench"
echo "    MySQL Workbench"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

