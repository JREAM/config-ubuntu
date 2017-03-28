#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing Chromium Browser, codecs, and driver"

sudo apt-get install chromium-browser\
    chromium-codecs-ffmpeg\
    chromium-chromedriver

echo "(+) Complete! Check your apps menu. To launch from terminal: $ chromium-browser"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
