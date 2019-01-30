#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

ver="1.0.2"
echo "(+) Downloading Hashicorp Vault v$ver"

curl -o vault.zip "https://releases.hashicorp.com/vault/$ver/vault_${ver}_linux_amd64.zip"

unzip vault.zip && rm vault.zip
sudo chmod +x vault && sudo mv vault /usr/local/bin

echo "(+) Complete! Run with $ vault"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

