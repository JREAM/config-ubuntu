#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

pip install awscli

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Use with $ aws"
