#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Keys
echo "(+) Installing Dependencies"
sudo apt-get install -y socat jq

echo "(+) Copying Docker Complete Source"
curl -o $HOME_PATH/.docker-complete https://raw.githubusercontent.com/nicferrier/docker-bash-completion/master/docker-complete
sudo chown $USER:$USER $HOME_PATH/.docker-complete
source $HOME_PATH/.docker-complete

echo "(+) Complete! Run with $ docker ps <tab>"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
