#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Create user Permissions for usr/local
echo "(+) Installing FileZilla"
apt install -y filezilla

echo "(+) Complete! "
echo "(+) Check your Applications menu for FileZilla"
echo ""


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
