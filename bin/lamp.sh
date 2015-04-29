#/bin/bash
# These are most of the modules the general public use at some point.
sudo apt-get install -y\
    mysql-server\
    php5\
    php5-dev\
    php5-curl\
    php5-mysql\
    php5-sqlite\
    php5-redis\
    php5-xmlrpc\
    php5-gd\
    php5-imagick\
    php5-intl\
    php5-mcrypt\
    libpcre3-dev\
    libsqlite3-dev\
    apache2\
    libapache2-mod-php5\
    libapache2-mod-wsgi

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

# Copy project folder over
if [ ! -d "~/projects" ]; then
    cp -r $PROJECT_FILE_PATH/projects ~/projects
else
    echo " (-) Skipping, ~/projects folder already exists"
fi

# Create VHost for the /home/user/projects folder
if [ ! -f /etc/apache2/sites-available/projects.conf ]; then

    echo " (+) Creating projects VirtualHost"

    echo "ServerName projects  
    <VirtualHost *:80>
    
        # Indexes + Directory Root.
        DocumentRoot /home/$USER/projects
        
        # Logfiles
        ErrorLog  /home/$USER/projects/error.log
        CustomLog /home/$USER/projects/access.log combined
        
    </VirtualHost>
    
    <Directory /home/$USER/projects>
        Header set Access-Control-Allow-Origin '*'
        Options Indexes Followsymlinks
        AllowOverride All
        Require all granted
    </Directory>" > projects.conf

    sudo mv projects.conf /etc/apache2/sites-available
    sudo a2ensite projects

    # Disable the default site
    sudo a2dissite 000-default
else
    echo " (-) Skipping, ~/projects folder already exists"
fi


# See if we need composer (Duplicate in Phalcon for now)
if [ ! -f /usr/local/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer
else
    sudo composer self-update
fi


# Turn on Short Open Tags
sudo sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php5/apache2/php.ini

# Turn Error Reporting On
sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php5/apache2/php.ini

# Turn Display Errors On
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini


# Some Apache Finishing up
sudo a2enmod rewrite headers
sudo service apache2 restart

echo "(+) LAMP Completed."
echo ""
echo "(+) You can edit /etc/hosts and append 'projects', eg:"
echo "    127.0.0.1 localhost projects"
echo ""
echo "    And you'll be able to access http://projects for your /home/$USER/projects folder!"
echo ""
