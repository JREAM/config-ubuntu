#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

ver="1.1.0"

echo "Installing Hashicorp Consul v$ver"

curl -o consul.zip "https://releases.hashicorp.com/consul/$ver/consul_${ver}_linux_amd64.zip"

unzip consul.zip
sudo mv consul /usr/local/bin
rm consul.zip

echo "(+) Complete! Run with $ consul"
echo "@   Also See Consul Tools: https://www.consul.io/downloads_tools.html"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

