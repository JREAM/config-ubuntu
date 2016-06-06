#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# These are core tools
sudo apt-get install -y\
    unzip\
    bzip2\
    git\
    curl\
    htop\
    xclip\
    screen\
    supervisor\
    terminator\
    tmux

# IMPORTANT: Do NOT have a trailing \ on the LAST item!
