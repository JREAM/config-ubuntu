#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION="1.4.1"

curl -o packer.zip "https://releases.hashicorp.com/packer/$VERSION/packer_${VERSION}_linux_amd64.zip"

unzip packer.zip && rm packer.zip
sudo chmod +x packer && sudo mv packer /usr/local/bin

echo "(+) Adding Bash Autocompletions"
sudo curl -o /etc/bash_completion.d/packer https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available/packer.completion.bash

echo "(+) Complete! Run with $ packer"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
