#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing Typora Markdown Editor (Cross Platform)"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb http://typora.io linux/' -y
sudo apt-get install typora -y

# If error messages pop up after running the command
# sudo dpkg -i google-chrome*.deb then run the command
# sudo apt-get install -f

echo "(+) Complete! It's great to sync with Google Drive/Dropbox for notes!"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
