#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Adding Swift Key"
wget -qO- http://dev.iachieved.it/iachievedit.gpg.key | sudo apt-key add -

echo "Adding Xenial Source List"
echo "deb http://iachievedit-repos.s3.amazonaws.com/ xenial main" | sudo tee --append /etc/apt/sources.list

sudo apt update
sudo apt install -y swift-3.0

echo "(+) Complete! Update your .bashrc with:"
echo "    export PATH=/opt/swift/swift-3.0/usr/bin:$PATH"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
