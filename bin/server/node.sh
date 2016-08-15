#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    nodejs\
    npm


echo "(+) Installing 'N' for latest stable Node Version."
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

echo "(+) Installing NodeJS Packages."
sudo npm install -g bower gulp grunt-cli marked node-gyp lodash graceful-fs minimatch


# Permissions for local NPM folder
sudo chown -R $(whoami) ~/.npm

echo "(+) Complete! Run with $ node and $npm."
