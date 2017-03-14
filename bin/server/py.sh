#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y\
    libssl-dev\
    python-dev\
    libffi-dev\
    libjpeg8-dev\
    libjpeg-dev\
    python-pip\
    python-dev\
    python3\
    python3-dev\
    python3-pip

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

pip install --upgrade pip
pip3 install --upgrade pip

pip install bpython virtualenv virtualenvwrapper fabric mycli --upgrade

echo "(+) Complete!"
echo "    $ python  (2.X)"
echo "    $ python3 (3.5)"
echo "    $ pip"
echo "    $ pip3"
echo ""
echo "    Virtualenv Python3 Example:"
echo "    $ mkproject -p /usr/bin/python3"
echo ""
echo "    PIP Packages: bpython, virtualenvwrapper, fabric, mycli"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
