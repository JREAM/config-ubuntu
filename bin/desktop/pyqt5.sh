#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing PyQt5-Dev-Tools"

sudo apt-get install pyqt5-dev-tools

echo "(+) Complete!"



if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
