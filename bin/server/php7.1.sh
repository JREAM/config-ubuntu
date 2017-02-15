#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# Install the Correct Item
if [[ $OS_CODENAME == 'xenial' ]]; then
    # PHP 7x
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

else
    # PHP 5x
    sudo apt-get install -y\
        php5\
        php5-dev\
        php5-cli\
        php5-curl\
        php5-gd\
        php5-imagick\
        php5-intl\
        php5-json\
        php5-mcrypt\
        php5-mongo\
        php5-mysql\
        php5-sqlite\
        php5-redis\
        php5-xmlrpc\
        php5-xdebug\
        libapache2-mod-php5

        # IMPORTANT: Do NOT have a trailing \ on the LAST item!

        # Turn on Short Open Tags
        sudo sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php5/apache2/php.ini

        # Turn Error Reporting On
        sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php5/apache2/php.ini

        # Turn Display Errors On
        sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini

        # Append X-Debug to it's INI
        sudo echo "zend_extension=xdebug.so

        xdebug.remote_enable=1
        xdebug.remote_handler=dbgp
        xdebug.remote_host=127.0.0.1
        xdebug.remote_port=9000
        xdebug.remote_log=\"/var/log/xdebug/xdebug.log\"
        " > /etc/php5/mods-available/xdebug.ini

        echo "(+) PHP5 Installed"
fi

# Shared Libraries
echo "(+) Installing Library Dependencies"
sudo apt-get install -y\
    libpcre3-dev\
    libsqlite3-dev\
    libapache2-mod-fastcgi\
    libapache2-mod-wsgi

echo "(+) Copying ~/project folder if it doesn't exist"
# Copy project folder over
if [ ! -d "~/projects" ]; then
    cp -r $PROJECT_FILE_PATH/projects ~
    sudo chown -R $USER:www-data ~/projects
    sudo chmod g+rw ~/projects
else
    echo " (-) Skipping, ~/projects folder already exists"
fi

echo "(+) Installing Composer"
# See if we need composer (Duplicate in Phalcon for now)
if [ ! -f /usr/local/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer
else
    sudo composer self-update
fi

echo "Adding current user to www-data group and setting permissions"
# Add user to www-data
sudo usermod -aG www-data $USER


# Add permissions to the composer folder incase it's wrong
sudo chown -R $USER:$USER ~/.composer
sudo chown g+rw ~/.composer

echo "(+) Complete, use $ php -v"
echo "    Visit http://localhost"
