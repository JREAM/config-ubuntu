#!/bin/bash
# Server: Quick Installer

# Required FLAG for child processes to run
export INSTALL_SCRIPT=true

# Allow an install to pause a brief moment after running
export SKIP_SLEEP=false

# The base script if needed
export BASE_SCRIPT='server'

# 1. PATH_VARS - Temporary Environment Variables.
# 2. USER_VARS - Temporary User Variables.
source ./bin/_export_path_vars.sh
source ./bin/_export_user_vars.sh

echo "====================================================================="
echo ""
echo "                        JREAM - Ubuntu Server                        "
echo ""
echo " * To exit at anytime press CTRL+C"
echo " * Installation runs after command is entered."
echo ""
echo "====================================================================="
echo ""

while true; do
  cat <<-command_list
    Servers:
    --------
    apache        Installs Apache
    nginx         Installs NGINX

    SSL:
    ----
    letsencrypt   Installs LetsEncrypt 90 day SSL Certs you must renew CRONtab

    Git:
    ----
    gitflow       The Gitflow model (with autocomplete)

    Databases:
    ----------
    mysql8.0      Install MySQL, common, utils
    mongo         Install MongoDB Community Edition
    postgres      Install Postgres
    redis         Install Redis (redis-server)

    Languages:
    ----------
    dart          Install Dart Language
    go            Install Google Go
    lua           Install Lua Language
    java          Install JRE and JDK (default-jre, not Oracle)
    php7.4        Install PHP 7.3 with common modules
    php8.1        Install PHP 8.1 with common modules
    py            Install Python2/3 PIP2/3 Devel,(bpython, mycli, virtualenvwrapper)
    rb            Install Ruby (ruby, ruby-dev, gem)
    rust          Install Rust Language (Installer)

    Languages Version Managers:
    ----------
    gvm           Install Golang Version Manager
    nvm           Install Node Version Manager
    pipenv        Install Python Pipenv
    phpenv        Install PHP Env Manager
    pyenv         Install Pyenv (Alternative to Pipenv)
    rbenv         Install RVM (Ruby Version Manager)

    pipauto       Install PIP Bash Auto Complete (Python, Globally)
                  Alias: pipac

    Frameworks/Util:
    -----------
    php-composer  Install/Update PHP Composer Package

    Utilities:
    ----------
    deploy        Simple Bash Script to deploy to servers, (Git: visionmedia/deply)
    perm          Update /usr/local permissions to group 'local'
    security      Install ClamAV, RKHunter (read instructions after install)

    Quit:
    -----
    q             Quit (or CTRL + C)

command_list

  echo ""
  echo "====================================================================="
  echo ""

  read -e -p "Type a Command: " cmd

  # Enable previous commands with arrow key
  history -s $cmd

  case $cmd in
  ansible)
    bash ./bin/server/ansible.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  apache)
    bash ./bin/server/apache.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  dart)
    bash ./bin/server/dart.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  deploy)
    bash ./bin/deploy.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  gitflow)
    bash ./bin/server/gitflow.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  go)
    bash ./bin/server/go.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  gvm)
    bash ./bin/server/gvm.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  java)
    bash ./bin/server/java.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  letsencrypt)
    bash ./bin/server/letsencrypt.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  lua)
    bash ./bin/server/lua.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  mongo)
    bash ./bin/server/mongo.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  mysql8.0)
    bash ./bin/server/mysql8.0.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  nginx)
    bash ./bin/server/nginx.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  node10)
    bash ./bin/server/node10.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  nvm)
    bash ./bin/server/nvm.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  perm)
    bash ./bin/perm.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  pipenv)
    bash ./bin/server/pipenv.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  php7.4)
    bash ./bin/server/php7.4.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  php8.1)
    bash ./bin/server/php8.1.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  php-composer)
    bash ./bin/server/php-composer.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  pipauto | pipac)
    bash ./bin/server/pipauto.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  phpenv)
    bash ./bin/server/phpenv.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  postgres)
    bash ./bin/server/postgres.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  py)
    bash ./bin/server/py.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  pyenv)
    bash ./bin/server/pyenv.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  rb)
    bash ./bin/server/rb.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  rbenv)
    bash ./bin/server/rbenv.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  rust)
    bash ./bin/server/rust.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  redis)
    bash ./bin/server/redis.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  rvm)
    bash ./bin/server/rvm.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  security)
    bash ./bin/security.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  util)
    bash ./bin/util.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  yarn)
    bash ./bin/server/yarn.sh
    echo ""
    echo "====================================================================="
    echo ""
    ;;
  q)
    exit 1
    ;;
  *)
    echo ""
    echo "    (!) OOPS! You typed a command that's not available."
    echo ""
    echo "====================================================================="
    echo ""
    sleep 2
    ;;

  esac

done
