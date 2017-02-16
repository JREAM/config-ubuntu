#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

# Ensure the dotfile submodule is installed
if [ "$(ls -A $PROJECT_DOTFILE_PATH)"  ]; then
    echo "(+) Dotfiles exists, copying";
else
    echo "(!) Error: You must install the submodule(s)."
    echo "    $ git submodule init && git submodule update"
    sleep 10
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
