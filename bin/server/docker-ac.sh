#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# Install Keys
echo "(+) Installing Dependencies"
sudo apt-get install -y socat jq

echo "(+) Copying Docker Complete Source"
curl -o ~/.docker-complete https://raw.githubusercontent.com/nicferrier/docker-bash-completion/master/docker-complete
source ~/.docker-complete

echo "(+) Complete! Run with $ docker ps <tab>"
