#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# These are core tools
sudo apt-get install -y\
    at\
    unzip\
    bzip2\
    git\
    curl\
    htop\
    gdebi\
    putty-tools\
    python-software-properties\
    software-properties-common\
    screen\
    supervisor\
    terminator\
    tree\
    tmux\
    whois\
    xclip

# IMPORTANT: Do NOT have a trailing \ on the LAST item!
