#/bin/bash
sudo apt-get install -y\
    python-dev\
    python-pip

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

sudo pip install virtualenvwrapper fabric --upgrade

echo "(+) Complete! Run with $ python and $ pip"