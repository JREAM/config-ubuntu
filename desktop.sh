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
    gnome         Install Gnome 3 GUI + Tweak Tool (You toggle at login or see README)
    gnome-chrome  Install Chrome Addon to allow installing Gnome Ext from Chrome
    gnome-vpn     Install OpenVPN items for Gnome
    numix         Install Numix Theme
    papirus       Install Papirus Icon Theme
    xenlism       Install Xenlism Theme, Icons, Wallpaper

    apport-off    Disable apport error reporting in GUI (The popup windows)
    projects      Creates ~/projects folder with www-data:www-data user/group
    shutter       Best Screenshot Tool (Instructions to overwrite PrintScreen after install)

    nemo          File Browser Alternative, very good!

    FTP/Cloud
    ---------
    crossftp      (Only Good one for S3/Glacier on Linux I could find)
                  30 Day Trial, Works with S3 and Glacier
    filezilla     FTP/FTPS Client
    fz                          (alias: filezilla)

    Firewall Personal
    -----------------
    ufw           Enable UFW Local: 80 443 3306 1337 2375 9000 8000-02

    Code Editors:
    ----------
    sublime-text  Installs sublime text 3 (deb package) (x64)
    st3                         (alias: sublime text 3)
    vscode        Install Visual Studio Code (apt) (x64)
    postman       The popular Postman Client for API testing
    monodevelop   Install C#/.NET editor (Install .NET and Monodevelop)

    Utilities:
    ----------
    arronax       Easily Create Launchers for any Linux Environment
    dot           Copy Dotfiles (.bashrc, .gitconfig, .gitignore)
    dropbox       Installs Dropbox (x64)
    hub           Official GitHub CLI tool $ hub
    ffmpeg        ffmpeg cli converter
    flux          f.lux for eye strain, GUI app
    perm          Update /usr/local permissions
    mysqlwb       Install MySQL Workbench
    security      Install ClamAV, RKHunter (read instructions after install)
    touchpad-tool Install touchpad-indicator.
    util          Install Utilities: (git, curl, htop, unzip, terminator, tmux, screen)
    utilxtra      Intall Bonus CLI Utilities (peco)
    vim           Install Vim (.vimrc and Vundle Plugins)
    vimycm        Install/Compile Vim YCM (You Compelete Me)

    Browser
    -------
    chromium      Install Chromium Browser and FFMPEG Codecs (blue icon)
    chrome        Install Chrome Stable (latest debian file)

    GUI
    -------
    cinnamon      Install Cinnamon GUI + Muffin + OpenGL

    Quit:
    -----
    q             Quit (or CTRL + C)

command_list

echo ""
echo "====================================================================="
echo ""

read -e -p "Type a Command: " cmd


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
        chrome)
            bash ./bin/desktop/chrome.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        cinnamon)
            bash ./bin/desktop/cinnamon.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        chromium)
            bash ./bin/desktop/chromium.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        crossftp)
            bash ./bin/desktop/crossftp.sh
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
        hub)
            bash ./bin/misc/hub-cli.sh
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
        fz|filezilla)
            bash ./bin/desktop/filezilla.sh
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
        gui)
            bash ./bin/desktop/gui.sh
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
        nemo)
            bash ./bin/desktop/nemo.sh
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
        utilxtra)
            bash ./bin/utilxtra.sh
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
        vimycm)
            bash ./bin/vimycm.sh
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
