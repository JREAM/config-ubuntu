#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

cd $HOME_PATH

echo "(+) Downloading x64 .deb file"
wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb

echo "(+) Installing Sublime Text"
sudo dpkg -i sublime-text_build-3126_amd64.deb
rm sublime-text_build-3126_amd64.deb

echo "(+) Complete! Run with $ subl (and check your apps menu)"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
