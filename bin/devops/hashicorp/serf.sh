#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading Hashicorp Serf"

curl -o serf.zip https://releases.hashicorp.com/serf/0.7.0/serf_0.7.0_linux_amd64.zip

unzip serf.zip
sudo mv serf /usr/local/bin
rm serf.zip

echo "(+) Complete! Run with $ serf"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

