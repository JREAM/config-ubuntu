#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    nodejs\
    npm

# Get Permissions for global install
if [ ! -d "$HOME/.node_modules" ] ; then
    mkdir $HOME/node_modules
fi

# Permissions for local NPM folder
if [ -d "$HOME/node_modules" ] ; then
    sudo chown -R $USER:$USER ~/node_modules
fi

echo "(+) Installing 'N' for latest stable Node Version."
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

echo "(+) Installing NodeJS Packages."
sudo npm install -g bower gulp webpack marked node-gyp lodash graceful-fs minimatch

echo "(+) Complete! Run with $ node and $npm."
