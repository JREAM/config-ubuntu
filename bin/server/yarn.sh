#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Installing Yarn (NPM Alternative)"

# https://github.com/yarnpkg/yarn/issues/2821
sudo apt remove cmdtest -y

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install -y yarn

echo "(+) Complete! Run with $ yarn"

if [ $SKIP_SLEEP == false ]; then
    sleep 3
fi
