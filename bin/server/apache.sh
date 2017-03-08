#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# These are most of the modules the general public use at some point.
sudo apt-get install -y\
    apache2

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

# Handle the project folder
/bin/bash $PROJECT_BIN_PATH/_mkproject_folder.sh

# Create VHost for the /home/user/projects folder
if [ ! -f /etc/apache2/sites-available/projects.conf ]; then

    echo " (+) Creating projects VirtualHost"

echo "<VirtualHost *:80>
    ServerName projects

    # Indexes + Directory Root.
    DocumentRoot $HOME_PATH/projects

    # Logfiles
    ErrorLog  $HOME_PATH/projects/error.log
    CustomLog $HOME_PATH/projects/access.log combined
</VirtualHost>

<Directory $HOME_PATH/projects>
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
    echo " (-) Skipping, $HOME_PATH/projects folder already exists"
fi

echo "(+) Disabling mpm_event and enabling mpm_prefork"
# For PHP Not Thread Safe
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork

# Some Apache Finishing up
sudo a2enmod rewrite headers
sudo service apache2 restart

echo "(+) Apache Completed."
echo ""
echo "(+) You can edit /etc/hosts and append 'projects', eg:"
echo "    127.0.0.1 localhost projects"
echo ""
echo "    And you'll be able to access http://projects for your $HOME_PATH/projects folder!"
echo "    If PHP doesn't parse run sudo a2dismod mpm_prefork && a2enmod mpm_event"
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
