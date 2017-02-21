#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading Hashicorp Nomad"

curl -o nomad.zip https://releases.hashicorp.com/nomad/0.4.1/nomad_0.4.1_linux_amd64.zip

unzip nomad.zip
sudo mv nomad /usr/local/bin
rm nomad.zip

echo "(+) Complete! Run with $ nomad"

sleep 4
