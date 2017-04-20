#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading Hashicorp Vagrant"

curl -o vagrant.deb https://releases.hashicorp.com/vagrant/1.9.3/vagrant_1.9.3_x86_64.deb
sudo dpkg -i vagrant.deb

rm vagrant.deb

echo "(+) Complete! Run with $ vagrant"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

