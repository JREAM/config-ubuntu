#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo ""
echo "(+) Running as $SUDO_USER, If this is not ROOT, disregard warnings"
echo ""

wget https://pear.php.net/go-pear.phar
php go-pear.phar
rm go-pear.phar
pear version

sudo apt install php7.2-dev -y # for phpize

pecl install xdebug



echo "\n"
echo "Complete: Pear Installed && Xdebug"
echo "You may need to add this to your php.ini (cli/apache2/php-fpm) whatever you like"
echo 'zend_extension="/usr/local/php/modules/xdebug.so"'
echo "\n"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
