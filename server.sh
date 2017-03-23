#!/bin/bash
#
# This will automatically install a lot of the packages for a quick start.

# Flag this as a proper starting point
export INSTALL_SCRIPT=true

# Allow an install to pause a brief moment after running
export SKIP_SLEEP=false

# The base script if needed
export BASE_SCRIPT='server'

# Source Temporary Environment Variables.
source ./bin/_export_path_variables.sh

# Source the variables so they are exported and assigned
source ./bin/_export_user_variables.sh

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
cat <<- command_list
    Servers:
    --------
    apache        Installs Apache
    nginx         Installs NGINX

    SSL:
    ----
    letsencrypt   Installs LetsEncrypt 90 day SSL Certs you must renew CRONtab

    Databases:
    ----------
    mysql         Install MySQL, common, utils
    mongo         Install MongoDB Community Edition
    postgres      Install Postgres
    redis         Install Redis (redis-server)
    elasticsearch Install Elastic Search

    Languages:
    ----------
    go            Install Google Go
    java          Install JRE and JDK (default-jre, not Oracle)
    node          Install NodeJS (nodejs, npm: n, bower, gulp)
    php7.0        Install PHP7 with common modules
    php7.1        Install PHP7.1 with common modules (Phalcon not ready)
    py            Install Python2/3 PIP2/3 Devel,(bpython,  mycli, virtualenvwrapper)
    rb            Install Ruby (ruby, ruby-dev, gem)

    Frameworks/Util:
    -----------
    php-composer  Install/Update PHP Composer Package
    php-phalcon   Install Phalcon (<=15 Wily & Below) or PHP7 (>=17 Xenial)
    php-laravel   Install Laravel (Composer global install as current user)
    php-lumen     Install Lumen ( Composer global install as current user )

    Utilities:
    ----------
    dot           Copy Dotfiles (.bashrc, .gitconfig, .gitignore)
    perm          Update /usr/local permissions to group 'local'
    security      Install ClamAV, RKHunter (read instructions after install)
    util          Install Utilities: (git, curl, htop, unzip, terminator, tmux, screen)
    utilxtra      Intall Bonus CLI Utilities (peco)
    vim           Install Vim & Plugins (.vimrc and Vundle Plugins)

    Quit:
    -----
    q             Quit (or CTRL + C)

command_list

echo ""
echo "====================================================================="
echo ""

read -p "Type a Command: " cmd

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
        dot)
            bash ./bin/dot.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        elasticsearch)
            bash ./bin/server/elasticsearch.sh
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
        mongo)
            bash ./bin/server/mongo.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        mysql)
            bash ./bin/server/mysql.sh
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
        node)
            bash ./bin/server/node.sh
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
        php-composer)
            bash ./bin/server/php-composer.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        php-laravel)
            bash ./bin/server/php-laravel.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        php-lumen)
            bash ./bin/server/php-lumen.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        php-phalcon)
            bash ./bin/server/php-phalcon.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        php7.0)
            bash ./bin/server/php7.0.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        php7.1)
            bash ./bin/server/php7.1.sh
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
        rb)
            bash ./bin/server/rb.sh
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
        utilxtra)
            bash ./bin/utilxtra.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        vault)
            bash ./bin/server/hashicorp/vault.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        vim)
            bash ./bin/vim.sh
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

    esac


done
