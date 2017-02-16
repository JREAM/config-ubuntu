#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
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

cp $PROJECT_DOTFILE_PATH/.vimrc ~
cp $PROJECT_DOTFILE_PATH/.vim ~

# Install Vundle (For VIM Plugins)
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

echo "(+) Complete! Run with $ vim"


