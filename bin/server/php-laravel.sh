#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Make sure permissions to the composer folder are correct
sudo chown -R $USER:$USER $HOME_PATH/.composer
sudo chmod g+rw $HOME_PATH/.composer

# TODO: Check if dir exists
sudo chmod gu+x $HOME_PATH/.composer/bin

composer global require "laravel/installer"

echo "(+) Complete, run with $ laravel"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
