#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y vim

cp $PROJECT_FILE_PATH/.vimrc ~

# Install Vundle (For VIM Plugins)
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

echo "(+) Complete! Run with $ vim"


