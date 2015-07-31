#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    default-jre

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Java Runtime in installed."