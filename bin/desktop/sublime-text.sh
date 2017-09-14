#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

cd $HOME_PATH

echo "(+) Adding Sublime Text GPG Key"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

echo "(+) Addding apt respository to /etc/apt/sources.list.d/sublime-text.list"
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

echo "(+) Updating & Installing"
sudo apt-get update
sudo apt-get install sublime-text -y

echo "(+) Complete! Run with $ subl (and check your apps menu)"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
