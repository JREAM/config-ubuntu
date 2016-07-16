#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

gsettings set org.gnome.desktop.wm.preferences button-layout'close,minimize,maximize:'


