#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install wget gpg -apt-transport-https -y

echo "(+) Adding GPG Key"

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg


echo "(+) Adding Apt Source (/etc/apt/sources.list.d/vscode.list)"
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

echo "(+) Updating Sources and installing: code"
sudo apt-get update
sudo apt-get install -y code

echo "(+) Complete! Run with $ code (or check your apps menu)"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
