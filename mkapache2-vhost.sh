#!/bin/bash
#
# This will automatically install a lot of the packages for a quick start.
if [[ $USER == "root" ]]; then
    "You must run this as the root user"
fi

if [ ! -d "/etc/nginx/" ]; then
    echo '( ! ) could not find /etc/nginx, please install it'
    exit
fi

echo "====================================================================="
echo ""
echo "                        JREAM - Make Apache2 Vhost                   "
echo ""
echo ""
echo " * Required: Apache 2.4+ ($ apache2 -v)"
echo " * PHP is for PHP7 and PHP 7 FPM"
echo ""
echo " * To exit at anytime press CTRL+C"
echo ""
echo "====================================================================="
echo ""

echo "!!! In Development !!!"
exit

read -p "Project Type [php, fpm]: " project_type
read -p "Project Root Folder [/home/ubuntu/mysite]: " project_root
read -p "Domain Name [mysite.com] (Auto adds www): " domain_name

# Trim all trailing slashes
project_root=$(echo $project_root | sed 's:/*$::')

if [ !-d $project_root ]; then
    echo "Could not find project root folder at: $project_root"
    exit
fi

if [ $project_type == 'fpm' ]; then

    sudo a2dismod php5 mpm_prefork
    sudo a2enmod actions fastcgi alias mpm_worker
    sudo cat > /etc/apache2/sites-available/$domain_name.conf <<EOF
        sudo vi /etc/php/7.0/fpm/pool.d/

EOF

# sudo service apache2 restart && sudo service php5-fpm restart

else if [ $project_type == 'php' ]; then

    sudo cat > /etc/apache2/sites-available/$domain_name.conf <<EOF
    <VirtualHost *:80>
        ServerName  $domain_name
        ServerAlias $domain_name www.$domain_name

        # Indexes + Directory Root.
        DirectoryIndex index.php
        DocumentRoot $project_root
        <Directory "$project_root">
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
        </Directory>
    </VirtualHost>
EOF

else
    echo "Unsupported Project Type: $project_type"
    exit
fi

# Give www-data group permissions
echo "( + ) Setting project group to www-data and adding g+rw permissions."
sudo chown -R $(whoami):www-data $project_root
sudo chmod -R g+rw:www-data $project_root

# Instructions
echo "( ! ) To enable your site copy/paste: "
echo "sudo ln -s /etc/nginx/sites-available/$domain_name /etc/nginx/sites-enabled/$domain_name"
echo ""
echo "( ! ) Please test your configuration: "
echo "sudo nginx -t"
echo ""
echo "( + ) If everything looks good you can reload or restart: "
echo "sudo service nginx reload"
echo "sudo service nginx restart"
echo ""
