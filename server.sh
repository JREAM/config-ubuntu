#!/bin/bash
#
# This will automatically install a lot of the packages for a quick start.
if [[ $USER == "root" ]]; then
    "You should not run this as the root user, this configures local user files!"
fi

# Temporary Environment Variable.
export OS_CODENAME=`lsb_release -s -c`
export INSTALL_SCRIPT=true
export PROJECT_BIN_PATH=$PWD/bin    # (NO Trailing Slash!)
export PROJECT_FILE_PATH=$PWD/files  # (NO Trailing Slash!)
export PROJECT_DOTFILE_PATH=$PWD/dotfiles
export PROJECT_TEMP_PATH=$PWD/tmp    # (NO Trailing Slash!)

echo "====================================================================="
echo ""
echo "                        JREAM - Ubuntu Server                        "
echo ""
echo " RECOMMENDED: Run 'ppa' first to prevent any problems!"
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

    Databases:
    ----------
    mysql         Install MySQL, common, utils
    mongo         Install MongoDB Community Edition
    postgres      Install Postgres
    redis         Install Redis (redis-server)

    Languages:
    ----------
    go            Install Google Go
    java          Install JRE and JDK (default-jre, not Oracle)
    node          Install NodeJS (nodejs, npm: n, bower, gulp)
    php7.0        Install PHP7 with common modules
    php7.1        Install PHP7.1 with common modules (Phalcon not ready)
    php-composer  Install/Update PHP Composer Package
    py            Install Python packages (pip, bpython, python-dev, mycli, virtualenvwrapper)
    rb            Install Ruby (ruby, ruby-dev, gem)

    Frameworks:
    -----------
    php-phalcon    Install Phalcon (<=15 Wily & Below) or PHP7 (>=17 Xenial)
    php-laravel    Install Laravel (Composer global install as current user)

    DevOps:
    -------
    awscli         Install AWS CLI tools
    docker         Install Docker
    docker-compose Install Docker Compose
    docker-machine Install Docker Machine
    docker-ac      Install Docker Autocomplete CLI
    ansible        Install Ansible Provisioner
    saltstack      Install SaltStack Provisioner
    consul         Install Hashicorp Consul
    nomad          Install Hashicorp Nomad
    packer         Install Hashicorp Packer
    serf           Install Hashicorp Serf
    terraform      Install Hashicorp Terraform
    vault          Install Hashicorp Vault
    vagrant        Install Hashicorp Vagrant

    Benchmarking:
    -------------
    iperf          Install iperf CLI util
    sysbench       Install sysbench CLI util
    wrk2           Install wrk2 CLI util

    Utilities:
    ----------
    dot           Copy Dotfiles (.bashrc, .gitconfig, .gitignore)
    perm          Update /usr/local permissions to group 'local'
    security      Install ClamAV, RKHunter (read instructions after install)
    util          Install Utilities: (git, curl, htop, unzip, terminator, tmux, screen)
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
        awscli)
            bash ./bin/server/awscli.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        composerusr)
            bash ./bin/server/composer-global-user.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        consul)
            bash ./bin/server/hashicorp/consul.sh
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
        docker)
            bash ./bin/server/docker.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        docker-ac)
            bash ./bin/server/docker-ac.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        docker-compose)
            bash ./bin/server/docker-compose.sh
            echo ""
            echo "====================================================================="
            ;;
        docker-machine)
            bash ./bin/server/docker-machine.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        iperf)
            bash ./bin/server/benchmark/iperf.sh
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
        nomad)
            bash ./bin/server/hashicorp/nomad.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        packer)
            bash ./bin/server/hashicorp/packer.sh
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
        saltstack)
            bash ./bin/server/saltstack.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        serf)
            bash ./bin/server/hashicorp/serf.sh
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
        sysbench)
            bash ./bin/server/benchmark/sysbench.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        terraform)
            bash ./bin/server/hashicorp/terraform.sh
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
        vagrant)
            bash ./bin/server/hashicorp/vagrant.sh
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
        wrk2)
            bash ./bin/server/benchmark/wrk2.sh
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
