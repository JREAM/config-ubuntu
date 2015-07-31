#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    nodejs
    npm

echo "(+) Installing NodeJS Packages."
sudo npm install bower gulp grunt-cli n -g

# Permissions for local NPM folder
sudo chown -R $(whoami) ~/.npm

echo "(+) Complete! Run with $ node and $npm."
