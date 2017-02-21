#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading Hashicorp Vagrant"

curl -o vagrant.deb https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_x86_64.deb
sudo dpkg -i vagrant.deb

rm vagrant.deb

echo "(+) Complete! Run with $ vagrant"

sleep 4
