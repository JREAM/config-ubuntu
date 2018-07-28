#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

ver="0.10.4"
echo "(+) Downloading Hashicorp Vault v$ver"

curl -o vault.zip "https://releases.hashicorp.com/vault/$ver/vault_${ver}_linux_amd64.zip"


unzip vault.zip
sudo mv vault /usr/local/bin
rm vault.zip

echo "(+) Complete! Run with $ vault"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

