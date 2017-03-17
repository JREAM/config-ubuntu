#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo ""
echo "(+) Running as $SUDO_USER, If this is not ROOT, disregard warnings"
echo ""

# ------------------------------------
# Get composer home path
#   *does NOT end in trailing slash
# Add sticky permissions
# ------------------------------------
COMPOSER_HOME=`composer config -g home`

if [ ! -d "$COMPOSER_HOME" ]; then
    mkdir "$COMPOSER_HOME"
    sudo chown $USER:$USER "$HOME_PATH/$COMPOSER_HOME"
    chmod g+rws "$COMPOSER_HOME"
fi

# See if we need composer (Duplicate in Phalcon for now)
if [ ! -f /usr/local/bin/composer ]; then
    # ------------------------------------
    # Download/Install Compose
    # Move to /usr/local/bin for all users
    # ------------------------------------
    echo "(+) Installing PHP Composer."
    curl -sS https://getcomposer.org/installer | php
    echo "(+) Moved composer to /usr/local/bin/composer"
    sudo mv composer.phar /usr/local/bin/composer
    echo "(+) Installing Composer Autocomplete"
    composer global require bamarni/symfony-console-autocomplete
    echo "(+) Installing Important global Packages"
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
    echo "( + ) Done installing composer packages"
else
    # ------------------------------------
    # Update: Composer
    # Update: Composer Autocompletions
    # ------------------------------------
    echo "(+) Updating PHP Composer."
    composer self-update

    echo "(+) Updating Global Composer Packages (--prefer-dist)"
    composer update

    if [ -d "$COMPOSER_HOME/vendor/bamarni/symfony-console-autocomplete" ]; then
        # Exists, Update
        composer global update bamarni/symfony-console-autocomplete
    else
        # Doesn't exist, Install
        composer global require bamarni/symfony-console-autocomplete
    fi

    echo "(+) Done updating composer packages"

fi


echo '# ---------------------------------------------
 If you did not run the `dot` installation,
 please look at dotfiles/.profile and under
 the PHP section.

 If you update your .profile, run:

    $ source $HOME_PATH/.profile

# ---------------------------------------------
'

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
