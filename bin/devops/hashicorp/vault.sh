#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading Hashicorp Vault"

curl -o vault.zip https://releases.hashicorp.com/vault/0.8.2/vault_0.8.2_linux_amd64.zip


unzip vault.zip
sudo mv vault /usr/local/bin
rm vault.zip

echo "(+) Complete! Run with $ vault"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

