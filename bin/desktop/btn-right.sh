#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

gsettings set org.gnome.desktop.wm.preferences button-layout':minimize,maximize,close'

sleep 2
