#!/bin/bash
#
# This will automatically install a lot of the packages for a quick start.
# You can configure them yourself according to the readme.
#
# To run:
#   $ sudo ./bulk-install.sh
#
if [[ $USER == "root" ]]; then
    "You should not run this as the root user, this configures local user files!"
fi

# Temporary Environment Variable.
export INSTALL_SCRIPT=true
export PROJECT_BIN_PATH= $PWD/bin    # (NO Trailing Slash!)
export PROJECT_FILE_PATH=$PWD/files  # (NO Trailing Slash!)
export PROJECT_TEMP_PATH=$PWD/tmp    # (NO Trailing Slash!)

echo "====================================================================="
echo ""
echo "                        JREAM - Config Ubuntu                      "
echo ""
echo " RECOMMENDED: Run 'ppa' first to prevent any problems!"
echo ""
echo " * To exit at anytime press CTRL+C"
echo " * Select a Package to install (Or, Type A at anytime to install ALL)"
echo " * Installation runs after command is entered."
echo ""
echo "====================================================================="
echo ""

while true; do
cat <<- command_list
    CMD         PROCESS
    ----        --------------------------------
    A           Run All Commands
    ----        --------------------------------
    apache      Use for PHP5 Versions
    btnleft     Move Close/Min/Max to Left on Windows
    btnright    Move Min/Max/Close to Right on Windows (Familiar to Windows OS)
    dot         Copy Dotfiles (.bashrc, .gitconfig, .gitignore)
    gnome       Install Gnome 3 GUI Tools (You toggle at login or see README)
    gui         Install Ubuntu GUI Tools (Compiz, Unity Tweak)
    hotkeys     Removes Email/WWW hotkeys, adds <Super+e> to Home Folder
    java        Install JRE and JDK (System-Defaults)
    mysql       Install MySQL, MySQL-Workbench, common, utils (not the server)
    node        Install NodeJS (nodejs; npm: n, bower, gulp)
    nginx       Installs NGINX (Don't use LA[pache]MP and NGINX)
    perm        Update /usr/local permissions
    php5phalcon Install Phalcon PHP Framework (Adds PPA)
    php7phalcon Install Phalcon PHP Framework with Zephir (Compiles, Takes Time)
    php5        Installs PHP5 and popular packages
    php7        Installs PHP7 and popular packages
    ppa         Install PPAs (nodejs, wine, git, numix)
    py          Install Python (python, bpython, python-dev, pip)
    redis       Install Redis (redis-server)
    security    Install ClamAV, RKHunter (read instructions after install)
    util        Install Utilities (git, curl, htop, unzip, terminator, tmux, screen)
    vim         Install Vim (.vimrc and Vundle Plugins)
    q           Quit (or CTRL + C)

command_list

echo ""
echo "====================================================================="
echo ""

read -p "Type a Command: " cmd


    case $cmd in
        A)
            for entry in ./bin/*
            do
                bash $entry
            done
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        apache)
            bash ./bin/apache.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        btnleft)
            bash ./bin/btn-left.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        btnright)
            bash ./bin/btn-right.sh
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
        gnome)
            bash ./bin/gnome.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        gui)
            bash ./bin/gui.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        hotkeys)
            bash ./bin/hotkeys.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        java)
            bash ./bin/java.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        mysql)
            bash ./bin/mysql.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        nginx)
            bash ./bin/nginx.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        node)
            bash ./bin/node.sh
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
        php5-phalcon)
            bash ./bin/php6-phalcon.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        php7-phalcon)
            bash ./bin/php7-phalcon.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        php5)
            bash ./bin/php5.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        php7)
            bash ./bin/php7.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        ppa)
            bash ./bin/ppa.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        py)
            bash ./bin/py.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        rb)
            bash ./bin/rb.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        redis)
            bash ./bin/redis.sh
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
