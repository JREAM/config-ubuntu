#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y\
    mysql-server\
    mysql-client\
    mysql-utilities

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

# /var/log/mysql/mysql-slow.log
echo "(+) Enabling Logging for slow queries, and default slow query time (2 sec)"

sudo sed -i '/log_slow_queries/s/#//g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i '/long_query_time/s/#//g' /etc/mysql/mysql.conf.d/mysqld.cnf


echo "(+) Complete! Installed MySQL Utilities."
echo "    MySQL Server, Client, Utilities"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
