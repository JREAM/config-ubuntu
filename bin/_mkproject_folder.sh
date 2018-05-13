#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Will MK_PROJECT_FOLDER projects and logs
MK_PROJECT_FOLDER="${HOME_PATH}/projects"
MK_LOGS_FOLDER="${MK_PROJECT_FOLDER}/logs/"

[ ! -d $MK_LOGS_FOLDER ] && mkdir -p $MK_LOGS_FOLDER || echo 'Skipping Logs folder, exists...'

# Copy project folder over
if [ ! -d $MK_PROJECT_FOLDER ]; then
    echo "(+) Creating Projects Folder: ${MK_PROJECT_FOLDER}"
    mkdir -p $MK_PROJECT_FOLDER

    echo "(+) Copying Default Index Filed Over."
    cp -r $PROJECT_FILE_PATH/projects/* $MK_PROJECT_FOLDER

    echo "(+) Setting permissions to www-data:www-data and g+rwx"
    sudo chown -R $USER:www-data $MK_PROJECT_FOLDER

    echo "(+) Ensuring $USER is in www-data group"
    sudo usermod -aG www-data $USER

    echo "(+) Returning default files to -x (For new setup only)"
    while IFS= read -r -d $'\0' file; do
        sudo chmod -x $file
    done < <(find $MK_PROJECT_FOLDER -type f -print0)

else
    echo " (-) Skipping, $MK_PROJECT_FOLDER folder already exists"
fi

echo "(+) Complete; Please append \"projects\" to your /etc/hosts file:"
echo "    $ sudo vim /etc/hosts"
echo " The first line should look similar to this:"
echo " 127.0.0.1 localhost projects"
echo ""
echo "Projects is the servername used in the apache or nginx config."
echo "Lastly if you are using my .bashrc or .bash_alias source it to enable shortcuts:"
echo "  (Apache) $ a2reload $ a2restart or (NGINX) $ ngensite $ ngdissite and many more."
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

