#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# These are core tools
sudo apt-get install -y\
    vim\
    unzip\
    bzip2\
    git\
    mercurial\
    curl\
    htop\
    xclip\
    screen\
    terminator\
    tmux

# IMPORTANT: Do NOT have a trailing \ on the LAST item!
