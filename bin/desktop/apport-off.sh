#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport

echo "(+) Complete.  /etc/default/apport enabled=0"
echo "    You should no longer get error popups"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
