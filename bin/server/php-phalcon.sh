#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | sudo bash

echo "(+) Installing Phalcon."

if [[ $OS_CODENAME == 'xenial' ]]; then
    # PHP7 Phalcon
    sudo apt-get install -y php7.0-phalcon
    sudo phpenmod phalcon
else
    # PHP5 Phalcon
    sudo apt-get install -y php5-phalcon
fi

echo "(+) Installing Phalcon Devtools."

echo $PROJECT_TEMP_PATH
echo '{"require":{"phalcon/devtools":"dev-master"}}' > $PROJECT_TEMP_PATH/composer.json
cd $PROJECT_TEMP_PATH

# Move the composer install items we want to a good spot
sudo mv vendor/phalcon/devtools/* $DEST_DIR

# Cleanup (We are already in the $DEFAULT_TMP_PATH)
sudo rm composer.json
sudo rm composer.lock
sudo rm -rf vendor


if [ ! -L /usr/bin/phalcon ]; then
    sudo ln -s $DEST_DIR/phalcon.php /usr/bin/phalcon
fi

echo "(+) Phalcon and Phalcon Tools Installed, use $ phalcon"

sleep 4
