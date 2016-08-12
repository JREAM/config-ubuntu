#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    ubuntu-restricted-addons\
    ubuntu-restricted-extras\
    unity-tweak-tool\
    compizconfig-settings-manager \
    compiz-plugins\
    dconf-editor\
    synaptic\
    gparted\
    unetbootin\
    gdebi\
    preload\
    bleachbit\
    alacarte\
    shutter\
    audacity\
    vlc\
    numix-gtk-theme\
    numix-icon-theme\
    numix-icon-theme-circle

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

cp $PROJECT_FILE_PATH/.config ~/.config
echo " (+) Terminator config added."

echo $PROJECT_FILE_PATH

if [ -f ~/compizconfig.profile ]; then
    rm ~/compizconfig.profile
fi

cp $PROJECT_FILE_PATH/compizconfig.profile ~
echo " (+) Make sure to Open Compiz and load the compizconfig.profile in ~"
