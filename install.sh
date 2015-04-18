#/bin/bash
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
    ppa         Install PPAs
    gui         Install Ubuntu GUI Tools
    util        Install Utilities
    jre         Install Java Runtime Enviroment
    lamp        Install LAMP (apache, php5, mysql)
    phalcon     Install PhalconPHP
    node        Install NodeJS (nodejs, bower, gulp, grunt-cli)
    rb          Install Ruby (ruby-2.0, ruby-2.0-dev)
    py          Install Python (python, python-dev, python-pip)
    redis       Install Redis
    nwjs        Install NW.js (io.js for GUI development in JS)
    dot         Copy Dotfiles
    perm        Update /usr/local permissions
    q           Quit
command_list
read -p "Type a Command: " cmd

    case $cmd in
        A)
            for entry in ./bin/*
            do
                bash $entry
            done
            ;;
        ppa)
            bash ./bin/ppa.sh
            ;;
        gui)
            bash ./bin/gui.sh
            ;;
        util)
            bash ./bin/util.sh
            ;;
        lamp)
            bash ./bin/lamp.sh
            ;;
        lamp)
            bash ./bin/phalcon.sh
            ;;
        node)
            bash ./bin/node.sh
            ;;
        jre)
            bash ./bin/jre.sh
            ;;
        nwjs)
            bash ./bin/nwjs.sh
            ;;
        dot)
            bash ./bin/dot.sh
            ;;
        rb)
            bash ./bin/rb.sh
            ;;
        py)
            bash ./bin/py.sh
            ;;
        redis)
            bash ./bin/redis.sh
            ;;
        perm)
            bash ./bin/perm.sh
            ;;
        q)
            exit 1
            ;;
        *)
            echo "Nothing"
    esac

    echo ""

done

read -p "Add Development PPA's? (Required for Developer Tools, Numix, NodeJS, Etc) (y/n): " ppa
read -p "Install Ubuntu GUI Tools (Unity Tweak, Compiz)? (y/n): " ubuntu_tools
read -p "Install Utilities? (y/n): " utilities

if [[ $ppa == "y" ]]; then
    read -p "Install Developer Tools (PHP, Apache, SQL, etc) ? (y/n): " web_dev_tools
    if [[ $web_dev_tools == "y" ]]; then
        read -p "Install Several NodeJS Packages? (Bower, Grunt-CLI, Gulp)? (y/n): " nodejs_packages
        read -p "Install NW.js for building Cross Platform Apps? ($ nw) (y/n): " nwjs
    fi
fi

read -p "Create New Group called 'local' (for /usr/local)? (y/n): " local_perms
read -p "Copy dotfiles for your user (.vimrc, .bashrc, etc)? (y/n): " dotfiles


if [[ $ppa == "y" ]]; then
    # This runs an update, since it's required for packages
    bash ./bin/ppa.sh
fi

# If PPA was NOT run we update
if [[ $ppa != "y" ]]; then
    sudo apt-get update
fi

sudo apt-get upgrade -y

if [[ $utilities == "y" ]]; then
    bash ./bin/utilities.sh
fi

if [[ $ubuntu_tools == "y" ]]; then
    bash ./bin/ubuntu-tools.sh
fi

if [[ $web_dev_tools == "y" ]]; then
    bash ./bin/web-tools.sh
fi

if [[ $local_perms == "y" ]]; then
    bash ./bin/local-permissions.sh
fi

if [[ $dotfiles == "y" ]]; then
    bash ./bin/dot-files.sh
fi

echo "====================================================================="
echo "                          You are Finished!                          "
echo ""
echo " * You can now remove this directory, or run $ git reset --hard HEAD"
echo "   to cleanup and temporary files created."
echo ""
if [[ $dotfiles == "y" ]]; then
    echo " * To install VIM Addons, please type:"
    echo "----------------------------------------------------------------------"
    echo "   $ vim (This takes you into vim)"
    echo "   :PluginInstall (Just type 'Plugin' and hit <TAB>)"
fi
echo ""
echo " * If you find any issues please report the issue on GitHub:"
echo "   https://github.com/JREAM/config-ubuntu"
echo ""
echo "====================================================================="
echo ""
echo ""