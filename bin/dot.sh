#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

cp $PROJECT_FILE_PATH/.bashrc ~
cp $PROJECT_FILE_PATH/.gitignore ~
cp $PROJECT_FILE_PATH/.gitconfig ~
cp $PROJECT_FILE_PATH/.exports ~
cp $PROJECT_FILE_PATH/.profile ~
cp $PROJECT_FILE_PATH/.jscsrc ~

# Reload Bash Config
source ~/.bashrc
source ~/.profile

echo "(+) Complete! Make sure to $ source ~/.bashrc && source ~/.profile"
