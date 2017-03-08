#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
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

# Ensure the dotfile submodule is installed
if [ "$(ls -A $PROJECT_DOTFILE_PATH)"  ]; then
    echo "(+) Dotfiles exists, copying";
else
    echo "(!) Error: You must install the submodule(s)."
    echo "    $ git submodule init && git submodule update"
    sleep 10
    exit
fi

cp $PROJECT_DOTFILE_PATH/.config $HOME_PATH/.config
echo " (+) Terminator config added."

echo $PROJECT_DOTFILE_PATH

if [ -f $HOME_PATH/compizconfig.profile ]; then
    rm $HOME_PATH/compizconfig.profile
fi

cp $PROJECT_DOTFILE_PATH/compizconfig.profile ~
echo " (+) Make sure to Open Compiz and load the compizconfig.profile in ~"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

