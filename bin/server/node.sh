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


# Get Permissions for global install
if [ ! -d "$HOME_PATH/.node_modules" ] ; then
    mkdir $HOME_PATH/node_modules
fi

# Permissions for local NPM folder
if [ -d "$HOME_PATH/node_modules" ] ; then
    sudo chown -R $USER:$USER $HOME_PATH/node_modules
fi

echo "(+) Installing 'n' for latest stable Node Version."
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

echo "(+) Complete! Run with $ node and $ npm."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
