#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Setting up Stacer"
sudo add-apt-repository ppa:oguzhaninan/stacer -y
echo "(+) Replacing 'cosmic' with 'bionic' for now."
sudo sed -i 's/cosmic/bionic/g'
sudo apt-get update
sudo apt-get install stacer -y

echo "(+) Complete! Look for Stacer in your application menu."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
