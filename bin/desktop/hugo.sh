#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Downloading Hugo"
wget https://github.com/spf13/hugo/releases/download/v0.20.1/hugo_0.20.1-64bit.deb -P $PROJECT_TEMP_PATH
cd $PROJECT_TEMP_PATH
sudo dpkg -i hugo*.deb
sudo apt-get install -f
rm hugo*.deb

echo "(+) Complete! Run with $ hugo"
echo "    for more visit: https://gohugo.io/"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
