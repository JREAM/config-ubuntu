#!/bin/bash
# Desktop: Quick Installer

# Required FLAG for child processes to run
export INSTALL_SCRIPT=true

# Allow an install to pause a brief moment after running
export SKIP_SLEEP=false

# The base script if needed
export BASE_SCRIPT='desktop'

# 1. PATH_VARS - Temporary Environment Variables.
# 2. USER_VARS - Temporary User Variables.
source ./bin/_export_path_vars.sh
source ./bin/_export_user_vars.sh


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
    gnome         Install Gnome 3 GUI + Tweak Tool (You toggle at login or see README)
    gnome-chrome  Install Chrome Addon to allow installing Gnome Ext from Chrome
    gnome-vpn     Install OpenVPN items for Gnome
    numix         Install Numix Theme
    papirus       Install Papirus Icon Theme
    xenlism       Install Xenlism Theme, Icons, Wallpaper

    apport-off    Disable apport error reporting in GUI (The popup windows)
    projects      Creates ~/projects folder with www-data:www-data user/group
    shutter       Best Screenshot Tool (Instructions to overwrite PrintScreen after install)

    Firewall Personal
    -----------------
    ufw           Enable UFW Local: 80 443 3306 1337 2375 9000 8000-02

    Code Editors:
    ----------
    sublime-text  Installs Sublime text 3 (deb package) (x64)
    vscode        Install Visual Studio Code (apt) (x64)
    postman       The popular Postman Client for API testing
    monodevelop   Install C#/.NET editor (Install .NET and Monodevelop)

    Utilities:
    ----------
    arronax       Easily Create Launchers for any Linux Environment
    dot           Copy Dotfiles (.bashrc, .gitconfig, .gitignore)
    dropbox       Installs Dropbox (x64)

    gh|gh-cli     Official GitHub CLI tool $ gh

    ffmpeg        ffmpeg cli converter
    flux          f.lux for eye strain, GUI app
    perm          Update /usr/local permissions
    mysqlwb       Install MySQL Workbench
    security      Install ClamAV, RKHunter (read instructions after install)
    stacer        Memory & System Optmizer
    guake         Drop down terminal

    touchpad-tool Install touchpad-indicator.
    util          Install Utilities: (git, curl, htop, unzip, terminator, tmux, screen)
    vim           Install Vim (.vimrc and Vundle Plugins)
    vimycm        Install/Compile Vim YCM (You Compelete Me)

    Browser
    -------
    brave         Install Brave Browser
    chrome        Install Chrome Stable (latest debian file)

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
        apport-off)
            bash ./bin/desktop/apport-off.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        arronax)
            bash ./bin/desktop/arronax.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        brave)
            bash ./bin/desktop/brave.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        beekeeper)
            bash ./bin/desktop/mysql-beekeeper-studio.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        chrome)
            bash ./bin/desktop/chrome.sh
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
        dropbox)
            bash ./bin/desktop/dropbox.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        gh|gh-cli)
            bash ./bin/misc/gh-cli.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        ffmpeg)
          bash ./bin/desktop/ffmpeg.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        flux)
          bash ./bin/desktop/flux.sh
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
        gnome-vpn)
            bash ./bin/desktop/gnome/gnome-vpn.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        guake)
            bash ./bin/desktop/guake.sh
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
        papirus)
            bash ./bin/desktop/papirus.sh
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
        postman)
            bash ./bin/desktop/postman.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        projects)
            bash ./bin/_mkproject_folder.sh
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
        shutter)
            bash ./bin/desktop/shutter.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        stacer)
            bash ./bin/desktop/stacer.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        st3|sublime-text)
            bash ./bin/desktop/sublime-text.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        touchpad-tool)
            bash ./bin/desktop/touchpad-tool.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        ufw)
            bash ./bin/desktop/ufw.sh
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
        vscode)
            bash ./bin/desktop/vscode.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        xenlism)
            bash ./bin/desktop/xenlism.sh
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

    esac


done
