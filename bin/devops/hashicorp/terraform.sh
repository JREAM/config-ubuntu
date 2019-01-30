#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

ver="0.11.11"

echo "(+) Downloading Hashicorp Terraform v$ver"

curl -o terraform.zip "https://releases.hashicorp.com/terraform/${ver}/terraform_${ver}_linux_amd64.zip"

unzip terraform.zip && rm terraforn.zip
sudo chmod +x terraform && sudo mv terraform /usr/local/bin

echo "Adding Bash Autocompletions"
sudo curl -o  /etc/bash_completion.d/terraform https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available/terraform.completion.bash

echo "(+) Complete! Run with $ terraform"
echo "@   Also See Modules: https://registry.terraform.io/"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

