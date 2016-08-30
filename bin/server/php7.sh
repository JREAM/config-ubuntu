#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# These are most of the modules the general public use at some point.
sudo apt-get install -y\
    php7.0\
    php7.0-dev\
    php7.0-cli\
    php7.0-fpm\
    php7.0-curl\
    php7.0-gd\
    php7.0-intl\
    php7.0-json\
    php7.0-mcrypt\
    php7.0-mysql\
    php7.0-soap\
    php7.0-sqlite\
    php7.0-tidy\
    php7.0-xmlrpc\
    php7.0-zip\
    php-redis\
    php-codesniffer\
    libapache2-mod-php7.0\
    libpcre3-dev\
    libsqlite3-dev

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

# Copy project folder over
if [ ! -d "~/projects" ]; then
    cp -r $PROJECT_FILE_PATH/projects ~/projects
else
    echo " (-) Skipping, ~/projects folder already exists"
fi

# See if we need composer (Duplicate in Phalcon for now)
if [ ! -f /usr/local/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer
else
    sudo composer self-update
fi

# Turn on Short Open Tags
sudo sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php/7.0/fpm/php.ini
sudo sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php/7.0/cli/php.ini

# Turn Error Reporting On
sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php/7.0/fpm/php.ini
sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php/7.0/cli/php.ini

# Turn Display Errors On
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php/7.0/fpm/php.ini
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php/7.0/cli/php.ini

echo "(+) PHP7.0 Completed."
echo ""
