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
    dot         Copy Dotfiles (.bashrc, .vimrc, .gitconfig, .gitignore)
    gnome       Install Gnome 3 GUI Tools (You toggle at login or see README)
    gui         Install Ubuntu GUI Tools (Compiz, Unity Tweak)
    jre         Install Java Runtime Enviroment (Default)
    lamp        Install LAMP (apache, php5, mysql)
    node        Install NodeJS (nodejs, bower, gulp, grunt-cli)
    perm        Update /usr/local permissions
    phalcon     Install PhalconPHP (Adds PPA)
    ppa         Install PPAs (nodejs, wine, git, numix icons)
    py          Install Python (python, python-dev, python-pip)
    redis       Install Redis (redis-server)
    util        Install Utilities (vim, git, curl, htop, unzip, terminator, tmux, screen)
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
        jre)
            bash ./bin/jre.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        lamp)
            bash ./bin/lamp.sh
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
        phalcon)
            bash ./bin/phalcon.sh
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
        util)
            bash ./bin/util.sh
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
