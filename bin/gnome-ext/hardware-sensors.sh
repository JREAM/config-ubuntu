#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Integrate Hardware Sensors Indicator in top panel."
echo "(+) Setup: hardware-indicator-sensors"

git clone https://github.com/alexmurray/gs-indicator-sensors-extension.git ~/.local/share/gnome-shell/extensions/indicator-sensors@alexmurray.github.com

echo "(+) Installed: hardware-indicator-sensors, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
