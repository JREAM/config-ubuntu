#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

source ../exports.sh

if [ ! -z $1 ]; then
  error "Developer Error! Missing Argument for php.sh"
  return 0
fi

PROGRAM=#1

case $PROGRAM in
apache)
  sudo apt install -y apache2
  # For PHP Not Thread Safe
  sudo a2dismod mpm_event
  sudo a2enmod mpm_prefork
  sudo a2enmod rewrite headers
  sudo service apache2 enable
  sudo service apache2 start
  sudo service apache2 status
  log "Installed Apache2; $ apache2 (config: /etc/apache2/)"
  ;;
nginx)
  sudo apt install -y nginx
  sudo service nginx enable
  sudo service nginx start
  sudo service nginx start
  sudo service nginx status
  log "Installed Nginx; $ nginx (config: /etc/nginx/)"
  ;;
caddy)
  # @TODO internet not working :)
  sudo apt install -y \
    debian-keyring \
    debian-archive-keyring \
    apt-transport-https
    log "Package: Caddy Webserver, adding /etc/apt/sources.list.d/caddy-stable.list"
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
    sudo apt update && sudo apt install -y caddy
  ;;
*)
  error "Developer Error! Invalid \$program for webservers.sh"
  ;;
esac
