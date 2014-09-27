#!/bin/bash

# The user directory to add things to
USER_DIR="/home/jesse/"

# Needed for PPA's on older Linux Versions
sudo apt-get install -y python-software-properties

# PPA's
sudo add-apt-repository ppa:numix/ppa
sudo apt-add-repository ppa:phalcon/stable
sudo add-apt-repository ppa:chris-lea/node.js

# Update
sudo apt-get update

# General Linux
sudo apt-get install -y compiz synaptic

# Numix Theme
sudo apt-get install -y numix-gtk-theme numix-icon-theme numix-icon-theme-circle

# Utilities
sudo apt-get install -y vim curl htop xclip terminator gdebi preload bleachbit wine ubuntu-restricted-extras
sudo apt-get install -y dbeaver sublime-text
sudo apt-get install -y libpcre3-dev default-jre

# Apache
sudo apt-get install -y libapache2-mod-php5 libapache2-mod-wsgi

# PHP
sudo apt-get install -y apache2 php5 php5-dev
sudo sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php5/apache2/php.ini
sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php5/apache2/php.ini
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini
# Append session save location to /tmp to prevent errors in an odd situation..
sudo sed -i '/\[Session\]/a session.save_path = "/tmp"' /etc/php5/apache2/php.ini


# MySQL
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -q -y install mysql-server

# MySQL Adjustment
sudo sed -i 's/bind-address/bind-address = 0.0.0.0#/' /etc/mysql/my.cnf
sudo mysql -u root -Bse "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION;"
sudo service mysql restart

# Redis
sudo apt-get install redis-server

# Composer Install
curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# PHP Items
sudo apt-get install -y php5-phalcon
sudo apt-get install -y php5-mcrypt php5-sqlite php5-mysql php5-curl
sudo bash install-phalcon-devtools.sh

sudo apt-get install -y python-pip
sudo pip install fabric virtualenv virtualenvwrapper flask grip

# NodeJS
sudo apt-get install -y nodejs

# Folders/Settings
cp templates/* "$USER_DIR"
cp "$USER_DIR"/apache/sites-available/projects.conf /etc/apache2/sites-available

# Add Host (Notice that is a 1 for first line)
sudo sed -i '1s/^/127.0.0.1 projects\n/' /etc/hosts

# Apache
sudo a2enmod rewrite alias
sudo a2dissite 000-default
sudo a2ensite project
sudo service apache2 reload


# Clear out Junk
sudo apt-get autoremove
