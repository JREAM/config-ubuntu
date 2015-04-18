#/bin/bash

if ! grep -q ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep "phalcon-stable"; then
    echo "(+) You need to add the PPA to install Phalcon."
    sudo add-apt-repository -y ppa:phalcon/stable
fi

echo "(+) Installing Phalcon."

sudo apt-get install -y\
    php5-phalcon

echo "(+) Phalcon Installed."
echo "(+) Installing Phalcon Dev Tools."

# Temporary Directory
TMP_DIR="$HOME/tmp_phalcon"

# Destination Directory
DST_DIR="/opt/phalcon_devtools"

if [ ! -d "$TMP_DIR" ]
    then mkdir "$TMP_DIR" && cd "$TMP_DIR"
fi

if [ ! -d "$DST_DIR" ]
    then mkdir "$DST_DIR"
fi

echo '{"require":{"phalcon/devtools":"dev-master"}}' > composer.json
composer install

if [ -d "/opt/phalcon_devtools" ]; then
    sudo rm -rf /opt/phalcon_devtools
    sudo mkdir /opt/phalcon_devtools
fi

sudo mv vendor/phalcon/devtools/* /opt/phalcon_devtools
cd ~

# Cleanup
rm -rf "$TMP_DIR"
rm -rf composer.json
rm -rf ./bin/composer.lock
rm -rf ./bin/vendor

if [ ! -L /usr/bin/phalcon ]; then
    sudo ln -s /opt/phalcon_devtools/phalcon.php /usr/bin/phalcon
fi

echo "(+) Phalcon Dev Tools Installed, run with $ phalcon."