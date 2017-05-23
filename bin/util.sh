#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# These are core tools
sudo apt-get install -y\
    at\
    ack-grep\
    unzip\
    bridge-utils\
    bzip2\
    git\
    git-extras\
    curl\
    elinks\
    htop\
    netperf\
    putty-tools\
    python-software-properties\
    pwgen\
    gpw\
    software-properties-common\
    screen\
    stress\
    stress-ng\
    supervisor\
    tree\
    tmux\
    whois\
    pydf\
    ncdu\
    super\
    direnv\
    colordiff\
    xclip

# For Additional Bash Scripts
mkdir ~/.bash

if [ $BASE_SCRIPT == 'desktop' ]; then
    sudo apt-get install -y\
        terminator\
        powertop\
        gdebi
fi

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

# Git Extras Autocomplete
cp "$PROJECT_FILE_PATH/gh_complete.sh" "$HOME_PATH/.bash/"
sudo chown $USER:$USER "$HOME_PATH/.bash/gh_complete.sh"

echo "(+) Completed install utilities."
echo ""
echo "    If you'd like git-extras autocomplete installed,"
echo "    add this to your ~/.bashrc file:"
echo ""
echo 'if [ -f "$HOME/.bash/gh_complete.sh" ]; then'
echo '   source "$HOME/.bash/gh_complete.sh"'
echo 'fi'
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 6
fi
