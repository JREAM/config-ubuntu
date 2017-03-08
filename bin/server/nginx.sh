#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y\
    nginx\
    nginx-extras

# Copy project folder over
/bin/bash $PROJECT_BIN_PATH/_mkproject_folder.sh

# Create VHost for the /home/user/projects folder
if [ ! -f /etc/nginx/sites-available/projects.conf ]; then

    echo " (+) Creating projects VirtualHost"

    sudo echo "server {
        listen 80;
        server_name projects localhost;
        root $HOME_PATH/projects;

        charset utf-8;

        index index.html index.php;

        access_log $HOME_PATH/projects/access.log;
        error_log $HOME_PATH/projects/error.log error;

        location / {
            try_files $uri $uri/ /index.php?$query_string;
        }

        location = /favicon.ico { access_log off; log_not_found off; }
        location = /robots.txt  { access_log off; log_not_found off; }
    }" > /etc/nginx/sites-available/projects

    sudo ln -s /etc/nginx/sites-available/projects /etc/nginx/sites-enabled/projects
    sudo rm /etc/nginx/sites-enabled/default
else
    echo " (-) Skipping, $HOME_PATH/projects folder already exists"
fi


sudo service nginx start


echo "(+) Nginx Completed."
echo ""
echo "(+) You can edit /etc/hosts and append 'projects', eg:"
echo "    127.0.0.1 localhost projects"
echo ""
echo "    And you'll be able to access http://projects for your $HOME_PATH/projects folder!"
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
