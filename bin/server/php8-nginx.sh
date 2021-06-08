#!/bin/bash
# @depends php-composer.sh
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION=8.0

echo -e "Adding ppa:ondrej/php repository to /etc/apt/sources.list.d/"
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install \
  php8-fpm \
  nginx

echo -e '[+] Restarting NginX with PHP (systemctl)'
sudo systemctl restart nginx
systemctl status php$VERSION-fpm

echo -e '[+] Adding Modules'
sudo apt-get install -y\
    php$VERSION-cli\
    php$VERSION-curl\
    php$VERSION-dev\
    php$VERSION-gd\
    php$VERSION-imap\
    php$VERSION-intl\
    php$VERSION-mbstring\
    php$VERSION-mongodb\
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
echo "(+) PHP Installed"

echo "Adding current user to www-data group and setting permissions"
# Add user to www-data
sudo usermod -aG www-data $USER
"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
