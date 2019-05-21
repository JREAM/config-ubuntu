#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION="2.2.4"
echo "(+) Downloading Hashicorp Vagrant v$VERSION"


curl -o vagrant.deb "https://releases.hashicorp.com/vagrant/$VERSION/vagrant_${VERSION}_x86_64.deb"
sudo dpkg -i vagrant.deb
rm vagrant.deb

echo "Adding Bash autocomplete"
sudo curl -o /etc/bash_completion.d/vagrant https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available/vagrant.completion.bash

echo "(+) Complete! Run with $ vagrant"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
