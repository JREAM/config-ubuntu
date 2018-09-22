#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo ""
echo "(+) Running as $SUDO_USER, If this is not ROOT, disregard warnings"
echo ""

COMPOSER_PATH=$HOME_PATH/.composer

if [ ! -d "$COMPOSER_PATH" ]; then
    mkdir -p $COMPOSER_PATH
    sudo chown -R $USER:$USER $COMPOSER_PATH
    chmod g+rws -R "$COMPOSER_PATH"
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
else
    # ------------------------------------
    # Update: Composer
    # Update: Composer Autocompletions
    # ------------------------------------
    echo "(+) Updating PHP Composer."
    composer self-update

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
 If you did not run the `dot` installation,  please look at dotfiles/.profile and under
 the PHP section. Update your ~/.profile and add:

    $ source $HOME_PATH/.profile

# ---------------------------------------------
'

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
