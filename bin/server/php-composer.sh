#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing/Updating PHP Composer"
# See if we need composer (Duplicate in Phalcon for now)
if [ ! -f /usr/local/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer

    # Add permissions to the composer folder
    sudo chown -R $USER:$USER $HOME_PATH/.composer
    sudo chmod g+rws $HOME_PATH/.composer
else
    echo $USER
    # Add permissions to the composer & cache folder BEFORE updating
    sudo chown -R $USER:$USER $HOME_PATH/.composer
    sudo chmod g+rws $HOME_PATH/.composer

    sudo composer self-update
fi

echo "(+) Installing/Updating composer packages for $USER"

composer global require --prefer-dist hirak/prestissimo
composer global require --prefer-dist phpunit/phpunit
composer global require --prefer-dist phpunit/dbunit
composer global require --prefer-dist phpunit/php-code-coverage
composer global require --prefer-dist phpunit/phpunit-mock-objects
composer global require --prefer-dist phing/phing
composer global require --prefer-dist sebastian/phpcpd
composer global require --prefer-dist phploc/phploc
composer global require --prefer-dist phpmd/phpmd
composer global require --prefer-dist squizlabs/php_codesniffer
composer global require --prefer-dist phpdocumentor/phpdocumentor:2.*

sudo chown $USER:$USER -R $HOME_PATH/.composer

echo "( + ) Done installing composer packages"
echo '( + ) Ensure your $HOME_PATH/.profile has the following:
# ---------------------------------------------

if [ -d "$USER/.composer/vendor/bin" ] ; then
    PATH="$USER/.composer/vendor/bin:$PATH"
fi

# ---------------------------------------------

Then run $ source $HOME_PATH/.profile

# ---------------------------------------------
'

sleep 4
