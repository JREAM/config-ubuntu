#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Copy project folder over
if [ ! -d "$HOME_PATH/projects" ]; then
    cp -r $PROJECT_FILE_PATH/projects $HOME_PATH/projects
    chown -R $USER:www-data $PROJECT_FILE_PATH/projects
    chmod g+rws -R $PROJECT_FILE_PATH/projects
else
    echo " (-) Skipping, $HOME_PATH/projects folder already exists"
fi


