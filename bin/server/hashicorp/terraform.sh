#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

echo "(+) Downloading Hashicorp Terraform"

curl -o terraform.zip https://releases.hashicorp.com/terraform/0.7.2/terraform_0.7.2_linux_amd64.zip

unzip terraform.zip
sudo mv terraform /usr/local/bin
rm terraform.zip

echo "(+) Complete! Run with $ terraform"