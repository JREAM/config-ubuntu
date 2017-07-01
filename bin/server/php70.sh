#!/bin/bash
# @depends php-composer.sh
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# PHP 7.0
sudo apt-get install -y\
    php7.0\
    php7.0-bz2\
    php7.0-dev\
    php7.0-cli\
    php7.0-common\
    php7.0-curl\
    php7.0-fpm\
    php7.0-gd\
    php7.0-imap\
    php7.0-intl\
    php7.0-json\
    php7.0-mbstring\
    php7.0-mcrypt\
    php7.0-mysql\
    php7.0-odbc\
    php7.0-opcache\
    php7.0-readline\
    php7.0-soap\
    php7.0-sqlite3\
    php7.0-tidy\
    php7.0-xml\
    php7.0-xmlrpc\
    php7.0-zip\
    php-redis\
    php-memcached\
    memcached\
    memcachedb\
    libapache2-mod-php7.0

    # IMPORTANT: Do NOT have a trailing \ on the LAST item!

# Configure PHP Options
# ------------------------
# Turn on Short Open Tags
sudo sed -i 's/short_open_tag.*$/short_open_tag = On/' /etc/php/7.0/fpm/php.ini
sudo sed -i 's/short_open_tag.*$/short_open_tag = On/' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/short_open_tag.*$/short_open_tag = On/' /etc/php/7.0/cli/php.ini

# Turn Error Reporting On
sudo sed -i 's/error_reporting.*$/error_reporting = E_COMPILE_ERROR | E_RECOVERABLE_ERROR | E_ERROR | E_CORE_ERROR/' /etc/php/7.0/fpm/php.ini
sudo sed -i 's/error_reporting.*$/error_reporting = E_COMPILE_ERROR | E_RECOVERABLE_ERROR | E_ERROR | E_CORE_ERROR/' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/error_reporting.*$/error_reporting = E_COMPILE_ERROR | E_RECOVERABLE_ERROR | E_ERROR | E_CORE_ERROR/' /etc/php/7.0/cli/php.ini

# Turn Display Errors On
sudo sed -i 's/display_errors.*$/display_errors = On/' /etc/php/7.0/fpm/php.ini
sudo sed -i 's/display_errors.*$/display_errors = On/' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/display_errors.*$/display_errors = On/' /etc/php/7.0/cli/php.ini

# Setup the Log file to /var/log/php/error.log
sudo sed -i 's/;error_log.*$/error_log = /var/log/php/error.log/'  /etc/php/7.0/fpm/php.ini
sudo sed -i 's/;error_log.*$/error_log = /var/log/php/error.log/'  /etc/php/7.0/apache2/php.ini
sudo sed -i 's/;error_log.*$/error_log = /var/log/php/error.log/' /etc/php/7.0/cli/php.ini

# Turn down from 60
sudo sed -i 's/;max_execution_time.*$/max_execution_time = 30/' /etc/php/7.0/fpm/php.ini
sudo sed -i 's/;max_execution_time.*$/max_execution_time = 30/' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/;max_execution_time.*$/max_execution_time = 30/' /etc/php/7.0/cli/php.ini

# Create folder for the logs
sudo mkdir -p /var/www/php
sudo touch /var/www/php/error.log
sudo chown -R www-data:www-data /var/www/php


echo "(+) PHP7 Installed and Configured"


# Shared Libraries
echo "(+) Installing Library Dependencies"
sudo apt-get install -y\
    libpcre3-dev\
    libsqlite3-dev\
    libapache2-mod-fastcgi\
    libapache2-mod-wsgi

echo "(+) Copying $HOME_PATH/project folder if it doesn't exist"

# Copy project folder over
bash $PROJECT_BIN_PATH/_mkproject_folder.sh

# Handle Composre
bash ./php-composer.sh


echo "Adding current user to www-data group and setting permissions"
# Add user to www-data
sudo usermod -aG www-data $USER


echo "(+) Complete, use $ php -v"
echo "    Visit http://localhost"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
