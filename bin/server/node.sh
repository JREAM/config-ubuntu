#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Yarn, It's Faster than NPM
sudo apt-key adv --keyserver pgp.mit.edu --recv D101F7899D41F3C3
echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update

sudo apt-get install -y\
    nodejs\
    npm\
    yarn

echo "(+) Installing 'n' for latest stable Node Version."
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

echo "(+) Complete! Run with $ node and $ npm."
echo "(!) If you cannot install a --global/-g package"
echo "    run the 'permissions' command."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
