#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# These are most of the modules the general public use at some point.
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
    php5-soap\
    php5-sqlite\
    php5-twig\
    php5-redis\
    php5-xmlrpc\
    php5-xdebug\
    php-codesniffer\
    libpcre3-dev\
    libsqlite3-dev\
    libapache2-mod-php5\
    libapache2-mod-fastcgi\
    libapache2-mod-wsgi

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

composer global require "hirak/prestissimo:^0.3"
composer global require "phpunit/phpunit=5.4.*"
composer global require "phpunit/php-code-coverage=^4.0"
composer global require "phpunit/phpunit-mock-objects=^3.2"

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

# Some Apache Finishing up

echo "(+) PHP5 Installed"
echo ""
