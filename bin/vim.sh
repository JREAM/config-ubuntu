#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

echo "(+) Installing VIM"
sudo apt-get install -y vim

# Install Vundle (For VIM Plugins)
echo "(+) Adding Vundle to ~/.vim/bundle/Vundle.vim"
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

echo "(+) Complete! Run with $ vim"
