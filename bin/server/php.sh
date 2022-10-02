#!/bin/bash
# @depends php-composer.sh
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

source ../exports.sh

if [ -n "$1" ]; then
  error "Developer Error! Missing Argument for php.sh"
  return 0
fi

function check_apt_list() {

  if [ -f /etc/apt/sources.list.d/ondrej-ubuntu-php-jammy.list ]; then
    echo -e "[+] Found: /etc/apt/sources.list.d/ondrej-ubuntu-php-jammy.list -- continuing."
    return 0
  fi

  info "[+] Adding APT PPA /etc/apt/sources.list.d/ondrej-ubuntu-php-jammy.list"
  sudo add-apt-repository ppa:ondrej/php -y
  sudo apt-get update
}

check_apt_list

# PHP Version to install
PROGRAM=$1

VALID=(
  7.1
  7.2
  7.3
  7.4
  8.0
  8.1
  8.2
)

if [[ ! " ${VALID[*]} " =~ " ${PROGRAM} " ]]; then
  echo 1 # whatever you want to do when array doesn't contain value

fi
# sed -i 's/^error_reporting.*/error_reporting = E_ALL/' /etc/php/8.1/fpm/php.ini
# sed -i 's/^display_errors.*/display_errors = On/' /etc/php/8.1/fpm/php.ini
# sed -i 's/^display_startup_errors.*/display_startup_errors = On/' /etc/php/8.1/fpm/php.ini
# sed -i 's/^upload_max_filesize.*/upload_max_filesize = 50M/' /etc/php/8.1/fpm/php.ini
# sed -i 's/^post_max_size.*/post_max_size = 50M/' /etc/php/8.1/fpm/php.ini

MODULES=(
  bz2
  clie
  common
  curl
  dev
  fpm
  gd
  http
  imagick
  imap
  intl
  mbstring
  mcrypt
  mysql
  oauth
  odbc
  opcache
  psr
  raphf
  readline
  redis
  sqlite3
  tidy
  uuid
  xdebug
  xml
  xmlrpc
  yaml
  zip
)

sudo apt-get install -y \
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-
  php$VERSION-

echo "Adding current user to www-data group and setting permissions"

echo "(+) Complete, use $ php -v"
echo "    Visit http://localhost"
