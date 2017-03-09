#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Changing /etc/default/apprt to enabled=0"
echo "    This prevents popups when linux has an error for sending reports"


sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport

echo "(+) Stopping Apport Service, It will not start on next boot"
echo "(+) Complete."
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
