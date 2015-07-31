#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

cp $PROJECT_FILE_PATH/.vimrc ~
cp $PROJECT_FILE_PATH/.bashrc ~
cp $PROJECT_FILE_PATH/.gitignore ~
cp $PROJECT_FILE_PATH/.hgignore ~
cp $PROJECT_FILE_PATH/.gitconfig ~
cp $PROJECT_FILE_PATH/.exports ~

# Reload Bash Config
source ~/.bashrc

# Install Vundle (For VIM Plugins)
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "(+) Complete! Make sure to $ source ~/.bashrc"
echo "(+) You also want to run $ vim and type :PluginInstall"
echo "(+) Make sure to change your ~/.gitconfig to your Name and Email!"