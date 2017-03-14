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
    bzip2\
    git\
    git-extras\
    curl\
    htop\
    netperf\
    putty-tools\
    python-software-properties\
    software-properties-common\
    screen\
    stress\
    stress-ng\
    supervisor\
    tree\
    tmux\
    whois\
    pydf\  # df alternative nicer output
    ncdu\  # du alterntive for browsable terminal ui
    xclip

if [ $BASE_SCRIPT == 'desktop' ]; then
    sudo apt-get install -y\
        terminator\
        gdebi
fi

# IMPORTANT: Do NOT have a trailing \ on the LAST item!



echo "(+) Completed install utilities."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
