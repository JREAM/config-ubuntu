#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

vim +PluginInstall +qall

echo "[+] Installing Vim YCM Dependencies"
# This will skip pyenv if installer
sudo apt-get install \
  build-essential \
  cmake \
  python-dev \
  python3-dev

echo "Installing the YCM Compiler"
cd ~/.vim/bundle/youcompleteme \
  && /usr/bin/python ./install.py --js-completer --clang-completer


echo "(+) Complete! Run with $ vim"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
