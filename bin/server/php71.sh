#!/bin/bash
# @depends php-composer.sh
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# PHP 7.1
sudo apt-get install -y\
    php7.1\
    php7.1-bz2\
    php7.1-dev\
    php7.1-cli\
    php7.1-common\
    php7.1-curl\
    php7.1-fpm\
    php7.1-gd\
    php7.1-imap\
    php7.1-intl\
    php7.1-json\
    php7.1-mbstring\
    php7.1-mcrypt\
    php7.1-mysql\
    php7.1-odbc\
    php7.1-opcache\
    php7.1-readline\
    php7.1-soap\
    php7.1-sqlite3\
    php7.1-tidy\
    php7.1-xml\
    php7.1-xmlrpc\
    php7.1-zip\
    php-redis\
    php-memcached\ # There is memcache also, but this ones used more
    memcached\
    memcachedb\
    libapache2-mod-php7.1

    # IMPORTANT: Do NOT have a trailing \ on the LAST item!
    # Turn on Short Open Tags
    #
    sudo sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php/7.0/fpm/php.ini
    sudo sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php/7.0/cli/php.ini

    # Turn Error Reporting On
    sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php/7.0/fpm/php.ini
    sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php/7.0/cli/php.ini

    # Turn Display Errors On
    sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php/7.0/fpm/php.ini
    sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php/7.0/cli/php.ini

    echo "(+) PHP7 Installed"

# Shared Libraries
echo "(+) Installing Library Dependencies"
sudo apt-get install -y\
    libpcre3-dev\
    libsqlite3-dev\
    libapache2-mod-fastcgi\
    libapache2-mod-wsgi

echo "(+) Copying $HOME_PATH/project folder if it doesn't exist"

# Copy project folder over
bin/bash $PROJECT_BIN_PATH/_mkproject_folder.sh

# Handle Composer
bash ./php-composer.sh


echo "Adding current user to www-data group and setting permissions"
# Add user to www-data
sudo usermod -aG www-data $USER


echo "(+) Complete, use $ php -v"
echo "    Visit http://localhost"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
