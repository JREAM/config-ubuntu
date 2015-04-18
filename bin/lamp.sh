#/bin/bash
sudo apt-get install -y\
    mysql-server\
    php5\
    php5-dev\
    php5-curl\
    php5-mysql\
    libpcre3-dev\
    libsqlite3-dev\
    apache2\
    libapache2-mod-php5

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

# Copy project folder over
if [ ! -d "~/projects" ]; then
    cp projects ~/projects
else
    echo " (-) Skipping, ~/projects folder already exists"
fi

# Add PHP Composer
curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer
