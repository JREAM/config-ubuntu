#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

ver="2.1.2"
echo "(+) Downloading Hashicorp Vagrant v$ver"


curl -o vagrant.deb "https://releases.hashicorp.com/vagrant/$ver/vagrant_${ver}_x86_64.deb"
sudo dpkg -i vagrant.deb

rm vagrant.deb

echo "(+) Complete! Run with $ vagrant"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

