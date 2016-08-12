#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    nginx

# Copy project folder over
if [ ! -d "~/projects" ]; then
    cp -r $PROJECT_FILE_PATH/projects ~/projects
else
    echo " (-) Skipping, ~/projects folder already exists"
fi

sudo service nginx start

echo "(+) NGINX installed in, it's in stop state."
