#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Peco"
wget https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_amd64.tar.gz

tar -zxvf peco_linux_amd64.tar.gz
sudo mv peco_linux_amd64/peco /usr/local/bin/
rm -rf peco_linux_amd64*

if [ $SKIP_SLEEP == false ]; then
    sleep 2
fi
