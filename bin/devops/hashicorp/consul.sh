#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION="1.5.0"

echo "Installing Hashicorp Consul v$VERSION"

curl -o consul.zip "https://releases.hashicorp.com/consul/$VERSION/consul_${VERSION}_linux_amd64.zip"

unzip consul.zip && rm consul.zip
sudo chmod +x consul && sudo mv consul /usr/local/bin


echo "(+) Complete! Run with $ consul"
echo "@   Also See Consul Tools: https://www.consul.io/downloads_tools.html"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
