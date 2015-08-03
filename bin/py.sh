#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    python-dev\
    python-pip

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

sudo pip install virtualenvwrapper fabric mycli --upgrade

echo "(+) Complete! Run with $ python and $ pip"
