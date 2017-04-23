#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Ensure the dotfile submodule is installed
if [ "$(ls -A $PROJECT_DOTFILE_PATH)"  ]; then
    echo "(+) Dotfiles exists, overwriting old.";
else
    echo "(!) Error: You must install the submodule(s)."
    echo "    $ git submodule init && git submodule update"
    sleep 10
    exit
fi

dotfiles=(
    'aws'
    'bash_aliases'
    'bashrc'
    'editorconfig'
    'exports'
    'gitconfig'
    'gitignore'
    'jscsrc'
    'jshintrc'
    'profile'
    'vimrc'
)

for i in "${dotfiles[@]}"
do
    src="$PROJECT_DOTFILE_PATH/.$i"
    dest="$HOME_PATH/"

    # Force Copy Overwrite
    sudo yes 2>/dev/null | cp -rf $src $dest
    sudo chown $USER:$USER "$HOME_PATH/.$i"
done

# Reload Bash Config
source $HOME_PATH/.bashrc
source $HOME_PATH/.profile

echo "(+) Complete! Make sure to $ source $HOME_PATH/.bashrc && source $HOME_PATH/.profile"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
