#!/bin/bash
# @depends php-composer.sh
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION=7.4

sudo apt-get install -y\
    php$VERSION\
    php$VERSION-dev\
    php$VERSION-common\
    #php$VERSION-fpm\
    php$VERSION-mbstring\
    php$VERSION-curl

#sudo phpdismod php$VERSION-fpm

# IMPORTANT: Do NOT have a trailing \ on the LAST item!
# Turn on Short Open Tags
#
echo "(+) PHP $VERSION Installed"


echo "Adding current user to www-data group and setting permissions"
# Add user to www-data
sudo usermod -aG www-data $USER


echo "(+) Complete, use $ php -v"
echo "    Visit http://localhost"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
