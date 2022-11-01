#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

if [ -n "$1" ]; then
  error "Developer Error! Missing Argument for databases.sh"
  return 0
fi

PROGRAM=$1

case $PROGRAM in
mysql)
  sudo apt install -y mysql-server mysql-client
  if [ -x /usr/bin/mysql ]; then
    log "Package: MySQL installed. ( $ mysql )" success
    log "Update Root Password:" info
    log "(1) sudo mysql" info
    log "(2) mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YOUR_PASSWORD';" info
    log "Enable Poor Query Logging:" info
    log "(1) sudo sed -i '/log_slow_queries/s/#//g' /etc/mysql/mysql.conf.d/mysqld.cnf"
    log "(2) sudo sed -i '/long_query_time/s/#//g' /etc/mysql/mysql.conf.d/mysqld.cnf"
  else
    log "Package: MySQL had an installation error." error
  fi
  ;;
redis)
  sudo apt install -y redis-server
  if [ -x /usr/bin/redis ]; then
    log 'Package: Redis Server installed. ( $ redis )' success
  else
    log 'Package: Redis had an installation error.' error
  fi
  ;;
mongo)
  # @TODO - See the new setup etc etv
  # @TODO - Test paths
  sudo apt install -y gnupg # Dependency
  # wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
  # echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
  # @TODO Convert to GPG key - see if Jammy version is even out
  # wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | gpg --dearmor | sudo tee /usr/share/keyrings/mongodb-org-6.0.gpg | > /dev/null 2&1
  # sudo apt install -y mongodb
  if [ -x /usr/bin/mongod ]; then
    log "PackageL Mongod installed. ( $ mongo )"
  else
    log "Package: Mongod had an installation error."
  fi
  ;;
postgres)
  # @TODO - Test Locations
  sudo apt install -y postgresql postgresql-client
  if [ -x /usr/bin/postgres ]; then
    log "Package: Postgresql installed. ( $ postgres ) " success
  else
    log 'Package: PostgreSQL had an installation error' error
  fi
  ;;
*)
  log "Database: $PROGRAM is not a valid choice in install"
  ;;
esac
