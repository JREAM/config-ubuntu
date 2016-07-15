#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    libssl-dev\
    python-dev\
    libffi-dev\
    libjpeg8-dev\
    libjpeg-dev\
    python-pip\
    python-dev

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

pip install bpython virtualenv virtualenvwrapper fabric mycli --upgrade

echo "(+) Complete! Run with $ python, $ bpython, and $ pip"
echo "    PIP Packages: bpython, virtualenvwrapper, fabric, mycli"
