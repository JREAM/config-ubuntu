#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

ver="0.11.7"

echo "(+) Downloading Hashicorp Terraform v$ver"

curl -o terraform.zip "https://releases.hashicorp.com/terraform/$ver/terraform_${ver}_linux_amd64.zip"

unzip terraform.zip
sudo mv terraform /usr/local/bin
rm terraform.zip

echo "(+) Complete! Run with $ terraform"
echo "@   Also See Modules: https://registry.terraform.io/"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

