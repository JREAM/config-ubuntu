#!/bin/bash
#
# This will automatically install a lot of the packages for a quick start.

# Flag this as a proper starting point
export INSTALL_SCRIPT=true

# Allow an install to pause a brief moment after running
export SKIP_SLEEP=false

# The base script if needed
export BASE_SCRIPT='desktop'

# Source Temporary Environment Variables.
source ./bin/_export_path_variables.sh

# Source the variables so they are exported and assigned
source ./bin/_export_user_variables.sh


echo "====================================================================="
echo ""
echo "                        JREAM - Ubuntu Desktop                       "
echo ""
echo " * To exit at anytime press CTRL+C"
echo " * Installation runs after command is entered."
echo ""
echo "====================================================================="
echo ""

while true; do
cat <<- command_list
    Configure:
    ----------
    btnleft      Move Close/Min/Max to Left on Windows
    btnright     Move Min/Max/Close to Right on Windows (Familiar to Windows OS)

    gnome        Install Gnome 3 GUI (You toggle at login or see README)
    gnome-chrome Install Chrome Addon to allow installing Gnome Ext from Chrome
    gui          Install Ubuntu GUI Tools (Compiz, Tweak)
    hotkeys      Removes Email/WWW hotkeys, adds <Super+e> to Home Folder
    numix        Install Numix Theme

    apport-off   Disable apport error reporting in GUI (The popup windows)

    Utilities:
    ----------
    dot          Copy Dotfiles (.bashrc, .gitconfig, .gitignore)
    perm         Update /usr/local permissions
    mysqlwb      Install MySQL Workbench
    security     Install ClamAV, RKHunter (read instructions after install)
    util         Install Utilities
                    git, curl, htop, unzip, terminator, tmux, screen
    vmware-tools Install VMWare Tools (When Mounted Only!)
    vim          Install Vim (.vimrc and Vundle Plugins)

    Quit:
    -----
    q             Quit (or CTRL + C)

command_list

echo ""
echo "====================================================================="
echo ""

read -p "Type a Command: " cmd


    case $cmd in
        apport-off)
            bash ./bin/desktop/apport-off.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        btnleft)
            bash ./bin/desktop/btn-left.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        btnright)
            bash ./bin/desktop/btn-right.sh
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
            bash ./bin/desktop/gnome/gnome-desktop.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        gnome-chrome)
            bash ./bin/desktop/gnome/gnome-chrome.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        gui)
            bash ./bin/desktop/gui.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        hotkeys)
            bash ./bin/desktop/hotkeys.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        mysqlwb)
            bash ./bin/desktop/mysql-workbench.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        numix)
            bash ./bin/desktop/numix.sh
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
        vmware-tools)
            bash ./bin/desktop/vmware-tools.sh
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
