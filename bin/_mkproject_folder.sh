#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

CREATE="${HOME_PATH}/projects"

function facl_file() {
    echo "(+) Set ACL for $USER:www-data rw [Files Only, Persist]"

    # Files cannot have defaults -d permissions
    while IFS= read -r -d $'\0' file; do
        echo "  Setting $file"
        # Default Mode: RW
        mode="rw"

        # If Executable, Add RWX
        if [[ -x "$file" ]]; then
            mode="rwx"
        fi
        sudo setfacl  -m u:$USER:$mode $file
        sudo setfacl  -m g:www-data:$mode $file
    done < <(find $CREATE -type f -print0)
    echo "(+) Done with Files"
}

function facl_dir() {
    echo "(+) Set ACL for $USER:www-data rwx [Directories Only, Persist]"
    while IFS= read -r -d $'\0' dir; do
        echo "  Setting $dir"
        sudo setfacl  -m u:$USER:rwx $dir
        sudo setfacl -dm u:$USER:rwx $dir
        sudo setfacl  -m g:www-data:rwx $dir
        sudo setfacl -dm g:www-data:rwx $dir
    done < <(find $CREATE -type d -print0)
    echo "(+) Done with Directories"
}

# Copy project folder over
if [ ! -d $CREATE ]; then
    echo "(+) Creating Projects Folder: ${CREATE}"
    mkdir -p $CREATE

    echo "(+) Copying Default Index Filed Over."
    cp -r $PROJECT_FILE_PATH/projects/* $CREATE

    echo "(+) Setting permissions to www-data:www-data and g+rwx"
    sudo chown -R $USER:www-data $CREATE

    echo "(+) Ensuring $USER is in www-data group"
    sudo usermod -aG www-data $USER

    echo "(+) Setting ACL and Persistent ACL for: $USER:www-data"
    sudo setfacl -Rdm d:g:www-data:rwx $CREATE,g:www-data:rwx $CREATE
    sudo setfacl -Rm d:u:$USER:rwx $CREATE,u:$USER:rwx $CREATE

    echo "(+) Returning default files to -x (For new setup only)"
    while IFS= read -r -d $'\0' file; do
        sudo chmod -x $file
    done < <(find $CREATE -type f -print0)

    echo -e "--- \$getfacl $CREATE records are ---\n"
    sudo getfacl $CREATE

else
    # Set Perms
    facl_file
    facl_dir
    echo " (-) Skipping, $CREATE folder already exists"
fi


