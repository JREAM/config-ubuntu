#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

CREATE="${HOME_PATH}/projects"

function facl() {
    echo "(+) Setting ACL -R & -Rd for $USER and www-data"
    sudo setfacl -R -m u:$USER:rw $CREATE
    sudo setfacl -Rd -m u:$USER:rw $CREATE
    sudo setfacl -R -m g:www-data:rw $CREATE
    sudo setfacl -Rd -m g:www-data:rw $CREATE
    echo "(+) Done"
}

# Copy project folder over
if [ ! -d $CREATE ]; then
    echo "(+) Creating Projects Folder: ${CREATE}"
    mkdir -p $CREATE

    echo "(+) Copying Default Index Filed Over."
    cp -r $PROJECT_FILE_PATH/projects/* $CREATE

    echo "(+) Setting permissions to www-data:www-data and g+rwx"
    sudo chown -R $USER:www-data $CREATE
    sudo chmod g+rw -R $PROJECT_FILE_PATH/projects
    # Set Perms
    facl
else
    # Set Perms
    facl
    echo " (-) Skipping, $CREATE folder already exists"
fi


