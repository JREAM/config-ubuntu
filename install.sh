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
export PROJECT_BIN_PATH= $PWD/bin    # (NO Trailing Slash!)
export PROJECT_FILE_PATH=$PWD/files  # (NO Trailing Slash!)
export PROJECT_TEMP_PATH=$PWD/tmp    # (NO Trailing Slash!)

echo "====================================================================="
echo "                        JREAM - Config Ubuntu                      "
echo ""
echo " * To exit at anytime press CTRL+C"
echo " * Select a Package to install (Or, Type A at anytime to install ALL)"
echo " * Installation runs after answers."
echo ""
echo "====================================================================="
echo ""

while true; do
cat <<- command_list
    CMD         PROCESS
    ----        --------------------------------
    A           Run All Commands
    dot         Copy Dotfiles (.bashrc, .vimrc, .gitconfig, .gitignore)
    gui         Install Ubuntu GUI Tools (Compiz, Unity Tweak)
    jre         Install Java Runtime Enviroment
    lamp        Install LAMP (apache, php5, mysql)
    node        Install NodeJS (nodejs, bower, gulp, grunt-cli)
    nwjs        Install NW.js (io.js for GUI development in JS)
    perm        Update /usr/local permissions
    phalcon     Install PhalconPHP
    ppa         Install PPAs (nodejs, wine, git, numix icons)
    py          Install Python (python, python-dev, python-pip)
    rb          Install Ruby (ruby-2.0, ruby-2.0-dev)
    redis       Install Redis
    util        Install Utilities (vim, git, curl, htop, terminator)
    q           Quit
command_list

echo ""

read -p "Type a Command: " cmd

    case $cmd in
        A)
            for entry in ./bin/*
            do
                bash $entry
            done
            ;;
        dot)
            bash ./bin/dot.sh
            ;;
        gui)
            bash ./bin/gui.sh
            ;;
        jre)
            bash ./bin/jre.sh
            ;;
        lamp)
            bash ./bin/lamp.sh
            ;;
        node)
            bash ./bin/node.sh
            ;;
        nwjs)
            bash ./bin/nwjs.sh
            ;;
        perm)
            bash ./bin/perm.sh
            ;;
        phalcon)
            bash ./bin/phalcon.sh
            ;;
        ppa)
            bash ./bin/ppa.sh
            ;;
        py)
            bash ./bin/py.sh
            ;;
        rb)
            bash ./bin/rb.sh
            ;;
        redis)
            bash ./bin/redis.sh
            ;;
        util)
            bash ./bin/util.sh
            ;;
        q)
            exit 1
            ;;
        *)
            echo ""
            echo "(!) Sorry, you typed a command that's not available."
    esac

    echo ""

done
