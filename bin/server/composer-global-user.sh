#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# Copy project folder over
if [ ! -f /usr/local/bin/composer ]; then
    echo "(!) Error: Please install composer through the PHP5 or PHP7 command first."
    exit
fi

echo "(+) Installing composer packages for user"

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
echo '( + ) Ensure your ~/.profile has the following:
# ---------------------------------------------

if [ -d "$HOME/.composer/vendor/bin" ] ; then
    PATH="$HOME/.composer/vendor/bin:$PATH"
fi

# ---------------------------------------------

Then run $ source ~/.profile

# ---------------------------------------------
'
