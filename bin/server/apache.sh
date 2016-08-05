#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# These are most of the modules the general public use at some point.
sudo apt-get install -y\
    apache2

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


# Some Apache Finishing up
sudo a2enmod rewrite headers
sudo service apache2 restart

echo "(+) Apache Completed."
echo ""
echo "(+) You can edit /etc/hosts and append 'projects', eg:"
echo "    127.0.0.1 localhost projects"
echo ""
echo "    And you'll be able to access http://projects for your /home/$USER/projects folder!"
echo ""
