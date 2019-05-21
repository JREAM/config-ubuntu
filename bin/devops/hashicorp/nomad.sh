#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION="0.9.1"

echo "(+) Downloading Hashicorp Nomad"

curl -o nomad.zip "https://releases.hashicorp.com/nomad/$VERSION/nomad_${VERSION}_linux_amd64-lxc.zip"

unzip nomad.zip && rm nomad.zip
sudo chmod +x nomad && sudo mv nomad /usr/local/bin


echo "(+) Complete! Run with $ nomad"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
