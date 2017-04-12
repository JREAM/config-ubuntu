#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing Chrome"

sudo apt-get install -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P $PROJECT_TEMP_PATH
sudo dpkg -i google-chrome*.deb
sudo rm google-chrome*.deb

# If error messages pop up after running the command
# sudo dpkg -i google-chrome*.deb then run the command
# sudo apt-get install -f

echo "(+) Complete! Check your apps menu. From Terminal, $ google-chrome"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
