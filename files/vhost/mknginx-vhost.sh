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
echo "                        JREAM - Make NGINX Vhost                     "
echo ""
echo ""
echo " * PHP is only for 7.X FPM"
echo " * Django should point to the location of the wsgi file."
echo "      However, you must take care of gunicorn and supervisor."
echo ""
echo " * To exit at anytime press CTRL+C"
echo ""
echo "====================================================================="
echo ""

read -p "Project Type [php, django]: " project_type
read -p "Project Root Folder [/home/ubuntu/mysite]: " project_root
read -p "Domain Name [mysite.com] (Auto adds www): " domain_name

# Trim all trailing slashes
project_root=$(echo $project_root | sed 's:/*$::')

if [ !-d $project_root ]; then
    echo "Could not find project root folder at: $project_root"
    exit
fi

if [ $project_type == 'django' ]; then
    sudo cat > /etc/nginx/sites-available/$domain_name <<EOF
    server {

        server_name $domain_name www.$domain_name;

        error_log /var/logs/nginx/$domain_name.error.log;

        location /media  {
            alias  $project_root/media/;
        }

        location /static {
            alias $project_root/static/;
        }

        location / {
            proxy_pass http://127.0.0.1:8000;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
    }
EOF

else if [ $project_type == 'php' ]; then

    sudo cat > /etc/nginx/sites-available/$domain_name <<EOF
    server {
        listen 80;

        root $project_root;
        index index.php index.html;

        server_name $domain_name www.$domain_name;

        error_log /var/logs/nginx/$domain_name.error.log;

        location / {
            try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
            try_files $uri =404;
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }

        location ~ /\.ht {
            deny all;
        }
    }
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
