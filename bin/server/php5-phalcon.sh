#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
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

sudo apt-get install -y\
    php5-phalcon

echo "(+) Phalcon Installed."
echo "(+) Installing Phalcon Dev Tools."

# Destination Directory
DEST_DIR="/usr/local/phalcon_devtools"

# Clear out anything old
if [ -d $DEST_DIR ]; then
    sudo rm -rf $DEST_DIR
fi
sudo mkdir $DEST_DIR

# See if we need composer (Duplicate in LAMP for now)
if [ ! -f /usr/local/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer
else
    sudo composer self-update
fi
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

echo "(+) Phalcon Dev Tools Installed, run with $ phalcon."
