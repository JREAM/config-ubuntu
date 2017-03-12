#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Menu for initiating SSH/Telnet/Custom Apps connections."
echo "(+) Setup: connection-manager"

cd ~
git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git ~/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com

echo "(+) Installed: connection-manager, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
