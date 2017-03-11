#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


curl -o consul.zip https://releases.hashicorp.com/consul/0.7.5/consul_0.7.5_linux_amd64.zip

unzip consul.zip
sudo mv consul /usr/local/bin
rm consul.zip

echo "(+) Complete! Run with $ consul"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

