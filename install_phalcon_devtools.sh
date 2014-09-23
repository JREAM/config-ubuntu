#!/bin/bash
#
# Run $ bash <filename>.sh
# Will be prompted to place in the /opt folder
#

# Temporary Directory
TMP_DIR="$HOME/tmp_phalcon"

# Destination Directory
DST_DIR="/opt/phalcon_devtools"

if [ ! -d "$TMP_DIR" ]
    then mkdir "$TMP_DIR" && cd "$TMP_DIR"
fi

if [ ! -d "$DST_DIR" ]
    then mkdir "$DST_DIR"
fi

echo '{"require":{"phalcon/devtools":"dev-master"}}' > composer.json
composer install

sudo mv vendor/phalcon/devtools/* /opt/phalcon_devtools
cd ~
rm -rf "$TMP_DIR"

sudo ln -s /opt/phalcon_devtools/phalcon.php /usr/bin/phalcon

