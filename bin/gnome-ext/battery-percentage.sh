#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Show battery remaining power percentage at the top panel"
echo "(+) Setup: battery-percentage"

cd ~
wget https://github.com/dnohales/battery-percentage-extension/archive/master.zip -O battery-percentage.zip
unzip battery-percentage.zip -d ~/.local/share/gnome-shell/extensions/battery-percentage@nohales.org
rm battery-percentage.zip

echo "(+) Installed: battery-percentage, use Tweak Tool > Extensions"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
