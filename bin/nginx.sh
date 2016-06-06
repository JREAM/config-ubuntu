#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    nginx

sudo service nginx stop

echo "(+) NGINX installed in, it's in stop state."
