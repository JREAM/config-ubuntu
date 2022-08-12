#!/bin/bash
# @depends php-composer.sh
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION=8.1

echo -e "(+) Adding ppa:ondrej/php repository to /etc/apt/sources.list.d/"
sudo add-apt-repository ppa:ondrej/php -y


echo -e '[+] Adding Modules'
sudo apt-get install -y\
    php$VERSION-bcmath\
    php$VERSION-bz2\
    php$VERSION-cli\
    php$VERSION-common\
    php$VERSION-curl\
    php$VERSION-dev\
    php$VERSION-fpm\
    php$VERSION-gd\
    php$VERSION-http\
    php$VERSION-imagick\
    php$VERSION-imap\
    php$VERSION-intl\
    php$VERSION-mbstring\
    php$VERSION-mcrypt\
    php$VERSION-mysql\
    php$VERSION-oauth\
    php$VERSION-odbc\
    php$VERSION-opcache\
    php$VERSION-psr\
    php$VERSION-readline\
    php$VERSION-redis\
    php$VERSION-sqlite3\
    php$VERSION-tidy\
    php$VERSION-uuid\
    php$VERSION-xdebug\
    php$VERSION-xml\
    php$VERSION-xmlrpc\
    php$VERSION-yaml\
    php$VERSION-zip

# IMPORTANT: Do NOT have a trailing \ on the LAST item!
# Turn on Short Open Tags
#
echo "(+) PHP $VERSION Installed"
echo "(+) Adding $USER user to www-data"
# Add user to www-data

sudo usermod -aG www-data $USER


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
