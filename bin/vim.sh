#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y vim

# Ensure the dotfile submodule is installed
if [ "$(ls -A $PROJECT_DOTFILE_PATH)"  ]; then
    echo "(+) Dotfiles exists, copying";
else
    echo "(!) Error: You must install the submodule(s)."
    echo "    $ git submodule init && git submodule update"
    sleep 10
    exit
fi

# vimrc is a file, vim is a folder
dotfiles=('vimrc')
for i in "${dotfiles[@]}"
do
    src="$PROJECT_DOTFILE_PATH/.$i"
    dest="$HOME_PATH/"

    # Force Copy Overwrite
    sudo yes | cp -rf $src $dest
    sudo chown $USER:$USER "$HOME_PATH/.$i"
done

# Install Vundle (For VIM Plugins)
if [ ! -d $HOME_PATH/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git $HOME_PATH/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

echo "(+) Complete! Run with $ vim"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
