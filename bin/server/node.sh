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

echo "(+) Installing 'nvm'"
mkdir $HOME_PATH/.nvm
sudo chown -R $USER:$USER/.nvm

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash


echo "(+) Complete! Run with $ node and $ npm. $ command -v nvm"
echo "(!) If you cannot install a --global/-g package"
echo "    run the 'permissions' command."

echo '(!) For NVM, set this in your .bashrc or .profile or .zsh:'
echo 'export NVM_DIR="$HOME/.nvm'
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm'

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
