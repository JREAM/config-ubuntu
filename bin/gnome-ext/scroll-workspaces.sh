#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Scroll workspaces from the top bar with mouse wheel"

echo "(+) Setup: gnome-shell-workspaces"

cd ~
git https://github.com/timbertson/gnome-shell-scroll-workspaces
cd gnome-shell-scroll-workspaces
mv scroll-workspace $HOME_PATH/.local/share/gnome-shell/extensions/scroll-workspaces@gfxmonk.net

echo "(+) Installed: gnome-shell-workspaces, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
