#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
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
