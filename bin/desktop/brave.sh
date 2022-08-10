#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt install apt-transport-https curl

echo "(+) Adding GPG Key"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg


echo "(+) Adding Apt Source (/etc/apt/sources.list.d/vscode.list)"
sudo echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo "(+) Updating Sources and installing: code"
sudo apt-get update
sudo apt-get install -y brave-browser 

echo "(+) Complete! Run with $ brave-browser (or check your apps menu)"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
