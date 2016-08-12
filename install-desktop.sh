#!/bin/bash
#
# This will automatically install a lot of the packages for a quick start.
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
echo "                        JREAM - Ubuntu Desktop                       "
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
    Configure:
    ----------
    btnleft     Move Close/Min/Max to Left on Windows
    btnright    Move Min/Max/Close to Right on Windows (Familiar to Windows OS)

    gnome       Install Gnome 3 GUI Tools (You toggle at login or see README)
    gui         Install Ubuntu GUI Tools (Compiz, Unity Tweak)
    hotkeys     Removes Email/WWW hotkeys, adds <Super+e> to Home Folder
    numix       Install Numix Theme

    Utilities:
    ----------
    dot         Copy Dotfiles (.bashrc, .gitconfig, .gitignore)
    perm        Update /usr/local permissions
    mysqlwb     Install MySQL Workbench
    security    Install ClamAV, RKHunter (read instructions after install)
    util        Install Utilities
                   git, curl, htop, unzip, terminator, tmux, screen
    vim         Install Vim (.vimrc and Vundle Plugins)

    Quit:
    -----
    q             Quit (or CTRL + C)

command_list

echo ""
echo "====================================================================="
echo ""

read -p "Type a Command: " cmd


    case $cmd in
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
            bash ./bin/desktop/gnome.sh
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
