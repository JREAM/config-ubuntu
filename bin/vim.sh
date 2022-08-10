#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing VIM"
sudo apt-get install -y vim

if [ -d dotfiles ]; then
    echo "(+) /dotfiles exists, copyring VIM Settings"
    # vimrc is a file, vim is a folder
    dotfiles=('vimrc')
    for i in "${dotfiles[@]}"
    do
        src="$REPO_DOTFILES_PATH/.$i"
        dest="$HOME_PATH/"

        # Force Copy Overwrite
        sudo yes | cp -rf $src $dest
        sudo chown $USER:$USER "$HOME_PATH/.$i"
    done

    # Install Vundle (For VIM Plugins)
    echo "(+) Adding Vundle to ~/.vim/bundle/Vundle.vim"
    if [ ! -d $HOME_PATH/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/gmarik/Vundle.vim.git $HOME_PATH/.vim/bundle/Vundle.vim
    fi

    if [ -d $HOME_PATH/.vim/bundle/Vundle.vim ]; then
        echo "(+) Installing VIM Vundle Plug-ins (If you had dotfiles)"
        vim +PluginInstall +qall
        sudo chown -R $USER:$USER $HOME_PATH/.vim/bundle
    fi


else
    echo "(-) /dotfiles does not exists, skipping"
fi

echo "(+) Complete! Run with $ vim"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
