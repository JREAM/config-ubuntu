#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing python2-dev, and python-3"

sudo apt-get install -y\
    libssl-dev\
    libffi-dev\
    libjpeg8-dev\
    libjpeg-dev\
    python-dev\
    python-pip\
    python-dev\
    python3\
    python3-dev\
    python3-pip\
    python3-venv

# IMPORTANT: Do NOT have a trailing \ on the LAST item!
echo "(+) Upgrading PIP"
pip install --upgrade pip
pip3 install --upgrade pip

echo "(+) Installing pyenv and pyenv virtualenv"
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

git clone https://github.com/pyenv/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv

# Ensure Permissions are right if run as sudo
sudo chmown -R $USER:$USER ~/.pyenv

echo "(+) Installing MyCLI (MySQL CLI), BPython, VirtualEnvWrapper"
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

echo " For PyEnv setup, please see the .bashrc file"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
