#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# These are most of the modules the general public use at some point.
sudo apt-get install -y\
    php7.1\
    php7.1-dev\
    php7.1-cli\
    php7.1-fpm\
    php7.1-curl\
    php7.1-gd\
    php7.1-intl\
    php7.1-json\
    php7.1-mcrypt\
    php7.1-mysql\
    php7.1-soap\
    php7.1-sqlite\
    php7.1-tidy\
    php7.1-xmlrpc\
    php7.1-zip\
    php-redis\
    php-codesniffer\
    libapache2-mod-php7.1\
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
sudo sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php/7.1/fpm/php.ini
sudo sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php/7.1/cli/php.ini

# Turn Error Reporting On
sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php/7.1/fpm/php.ini
sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php/7.1/cli/php.ini

# Turn Display Errors On
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php/7.1/fpm/php.ini
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php/7.1/cli/php.ini

echo "(+) PHP7.1 Completed."
echo ""
