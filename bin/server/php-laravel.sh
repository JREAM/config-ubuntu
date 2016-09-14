#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# Make sure permissions to the composer folder are correct
sudo chown -R $USER:$USER ~/.composer
sudo chown g+rw ~/.composer

composer global require "laravel/installer"

echo "(+) Complete, run with $ laravel"