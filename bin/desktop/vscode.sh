#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Adding GPG Key"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

echo "(+) Adding Apt Source (/etc/apt/sources.list.d/vscode.list)"
sudo sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

echo "(+) Updating Sources and installing: code"
sudo apt-get update
sudo apt-get install code 

echo "(+) Complete! Run with $ code (or check your apps menu)"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
