#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y\
    nginx

# Copy project folder over
if [ ! -d "$HOME_PATH/projects" ]; then
    cp -r $PROJECT_FILE_PATH/projects $HOME_PATH/projects
else
    echo " (-) Skipping, $HOME_PATH/projects folder already exists"
fi

sudo service nginx start

echo "(+) NGINX installed in, it's in stop state. To start run:"
echo "    sudo service nginx start"

sleep 4
