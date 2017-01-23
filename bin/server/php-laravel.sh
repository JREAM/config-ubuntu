#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# Make sure permissions to the composer folder are correct
sudo chown -R $SUDO_USER:$SUDO_USER ~/.composer
sudo chmod g+rw ~/.composer

# TODO: Check if dir exists
sudo chmod gu+x ~/.composer/bin

composer global require "laravel/installer"

echo "(+) Complete, run with $ laravel"
