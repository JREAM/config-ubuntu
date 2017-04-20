#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading Hashicorp Nomad"

curl -o nomad.zip https://releases.hashicorp.com/nomad/0.5.6/nomad_0.5.6_linux_amd64.zip

unzip nomad.zip
sudo mv nomad /usr/local/bin
rm nomad.zip

echo "(+) Complete! Run with $ nomad"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

