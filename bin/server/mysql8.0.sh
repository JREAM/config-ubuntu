#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

sudo apt-get install -y mysql-server-8.0 mysql-client-8.0

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

# /var/log/mysql/mysql-slow.log
echo "(+) Enabling Logging for slow queries, and default slow query time (2 sec)"
sudo sed -i '/log_slow_queries/s/#//g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i '/long_query_time/s/#//g' /etc/mysql/mysql.conf.d/mysqld.cnf

echo "(+) Complete! Installed MySQL Utilities."
echo "    MySQL Server, Client"
echo "    ---"
echo "    @help: to go around the root install"
echo "    sudo mysql"
echo "    mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'new_password';"
echo "    mysql> exit;"
echo ""

if [ $SKIP_SLEEP == false ]; then
  sleep 4
fi
