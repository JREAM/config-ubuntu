#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION="1.1.2"
echo "(+) Downloading Hashicorp Vault v$VERSION"

curl -o vault.zip "https://releases.hashicorp.com/vault/$VERSION/vault_${VERSION}_linux_amd64.zip"

unzip vault.zip && rm vault.zip
sudo chmod +x vault && sudo mv vault /usr/local/bin

echo "(+) Complete! Run with $ vault"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
