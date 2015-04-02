#/bin/bash
#
# This will automatically install a lot of the packages for a quick start.
# You can configure them yourself according to the readme.
#
# To run:
#   $ sudo ./bulk-install.sh
#
cd ~
sudo apt-get update && sudo apt-get upgrade -y

# This should come first for PPA's
sudo apt-get install -y python-software-properties\

sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:phalcon/stable
sudo add-apt-repository -y ppa:chris-lea/node.js

## Enable PPA
sudo apt-get install -y\
    unity-tweak-tool compizconfig-settings-manager compiz-plugins\
    dconf-editor synaptic unetbootin\
    vim\
    git mercurial meld\
    curl htop xclip terminator\
    gdebi preload bleachbit ubuntu-restricted-extras\
    numix-gtk-theme numix-icon-theme numix-icon-theme-circle\
    mysql-server\
    python-dev python-pip\
    php5 php5-dev php5-curl php5-phalcon php5-mysql\
    libsqlite3-dev libpcre3-dev\
    apache2 libapache2-mod-php5\
    redis-server\
    default-jre\
    ruby2.0 ruby2.0-dev\
    nodejs

# Add PHP Composer
curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer

# Permissions for local NPM folder
sudo chown -R $(whoami) ~/.npm
sudo npm install bower gulp grunt-cli n -g

# Create user Permissions for usr/local
sudo groupadd local
sudo usermod -a -G local jesse
sudo groupchgrp -R local /usr/local
sudo chmod -R g+rwx /usr/local
