#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

cp $PROJECT_DOTFILE_PATH/.bashrc ~
cp $PROJECT_DOTFILE_PATH/.gitignore ~
cp $PROJECT_DOTFILE_PATH/.gitconfig ~
cp $PROJECT_DOTFILE_PATH/.exports ~
cp $PROJECT_DOTFILE_PATH/.profile ~
cp $PROJECT_DOTFILE_PATH/.editorconfig ~
cp $PROJECT_DOTFILE_PATH/.jscsrc ~

# Reload Bash Config
source ~/.bashrc
source ~/.profile

echo "(+) Complete! Make sure to $ source ~/.bashrc && source ~/.profile"
