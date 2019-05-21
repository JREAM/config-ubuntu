#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION="0.8.1"

echo "(+) Downloading Hashicorp Serf v$VERSION"

curl -o serf.zip https://releases.hashicorp.com/serf/$VERSION/serf_${VERSION}_linux_amd64.zip

unzip serf.zip && rm serf.zip
sudo chmod +x serf && sudo mv serf /usr/local/bin

echo "(+) Complete! Run with $ serf"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
