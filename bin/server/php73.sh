#!/bin/bash
# @depends php-composer.sh
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y\
    php7.2\
    php7.2-dev\
    php7.2-common\
    #php7.2-fpm\
    php7.2-mbstring

#sudo phpdismod php7.2-fpm

# IMPORTANT: Do NOT have a trailing \ on the LAST item!
# Turn on Short Open Tags
#
sudo sed -i 's/short_open_tag*/short_open_tag = On/' /etc/php/7.1/{apache2,fpm,cli}/php.ini

# Turn Error Reporting On
sudo sed -i 's/error_reporting = E_ALL &*/error_reporting = E_ALL/' /etc/php/7.1/{apache2,cli,fpm}/php.ini

# Turn Display Errors On
sudo sed -i 's/display_errors =*/display_errors = On/' /etc/php/7.1/{apache2,cli,fpm}/php.ini


# Setup the Log file to /var/log/php/error.log
sudo sed -i 's/;error_log.*$/error_log = /var/log/php/error.log/'  /etc/php/7.1/{apache2,cli,fpm}/php.ini

# Turn down from 60
sudo sed -i 's/;max_execution_time.*$/max_execution_time = 30/' /etc/php/7.1/{apache2,cli,fpm}/php.ini


echo "(+) PHP7 Installed"

# Shared Libraries
echo "(+) Installing Library Dependencies"
sudo apt-get install -y\
    libpcre3-dev\
    libsqlite3-dev\
    libapache2-mod-fastcgi\
    libapache2-mod-wsgi # for Django/Flask if needed

echo "(+) Copying $HOME_PATH/project folder if it doesn't exist"

# Copy project folder over
. $PROJECT_BIN_PATH/_mkproject_folder.sh

# Handle Composer
. ./php-composer.sh


echo "Adding current user to www-data group and setting permissions"
# Add user to www-data
sudo usermod -aG www-data $USER


echo "(+) Complete, use $ php -v"
echo "    Visit http://localhost"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
