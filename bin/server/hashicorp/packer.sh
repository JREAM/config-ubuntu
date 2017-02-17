#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

curl -o packer.zip https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip

unzip packer.zip
sudo mv packer /usr/local/bin
rm packer.zip

echo "(+) Complete! Run with $ packer"

sleep 4
