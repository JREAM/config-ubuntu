#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    mysql-server\
    mysql-workbench\
    mysql-client\
    mysql-utilities

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Installed MySQL Utilities."
echo "    MySQL Server, Workbench, Client, Utilities"
