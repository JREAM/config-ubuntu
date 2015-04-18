#/bin/bash
cp .vimrc ~
cp .bashrc ~
cp .gitignore ~
cp .hgignore ~
cp .gitconfig ~
cp .exports ~

# Reload Bash Config
source ~/.bashrc

# Install Vundle (For VIM Plugins)
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "(+) Complete! Make sure to $ source ~/.bashrc"
echo "(+) You also want to run $ vim and type :PluginInstall"