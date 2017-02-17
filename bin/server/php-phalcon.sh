#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

if [ -f /etc/apt/sources.list.d/phalcon*ppa ]; then
    sudo rm /etc/apt/sources.list.d/phalcon*ppa
fi
sudo add-apt-repository -y ppa:phalcon/stable
echo "(+) Re-Adding Phalcon PPA."

# Update to get the new repo details
sudo apt-get update

echo "(+) Installing Phalcon."

if [[ $OS_CODENAME == 'xenial' ]]; then
    # PHP7 Phalcon
    sudo apt-get install -y php7.0-phalcon
    sudo sh -c 'echo "extension=phalcon.so" >> /etc/php/7.0/mods-available/phalcon.ini'
    sudo phpenmod phalcon
else
    # PHP5 Phalcon
    sudo apt-get install -y php5-phalcon
fi

echo "(+) Installing Phalcon Devtools."

echo $PROJECT_TEMP_PATH
echo '{"require":{"phalcon/devtools":"dev-master"}}' > $PROJECT_TEMP_PATH/composer.json
cd $PROJECT_TEMP_PATH
sudo composer install  # For Permission Issues :\

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
