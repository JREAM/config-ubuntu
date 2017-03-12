#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Switch between workspaces by scrolling at the edges of the screen or over the desktop background."
echo "(+) Setup: hardware-indicator-sensors"

git clone https://github.com/BrOrlandi/Desktop-Scroller-GNOME-Extension/archive/master.zip ~/.local/share/gnome-shell/extensions/desktop-scroller@brorlandi

echo "(+) Installed: hardware-indicator-sensors, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
