#/bin/bash
#
# This will automatically install a lot of the packages for a quick start.
# You can configure them yourself according to the readme.
#
# To run:
#   $ sudo ./bulk-install.sh
#
if [[ $USER == "root" ]]; then
    "You should not run this as the root user, this configures local user files!"
fi

echo "====================================================================="
echo "                        JREAM - Config Ubuntu                      "
echo ""
echo " * To exit at anytime press CTRL+C"
echo " * Your answers can be 'y' for yes, and empty for no (default)"
echo " * Installation runs after answers."
echo ""
echo "====================================================================="

read -p "Add Development PPA's? (Required for Developer Tools, Numix, NodeJS, Etc) (y/n): " ppa
read -p "Install Ubuntu GUI Tools (Unity Tweak, Compiz)? (y/n): " ubuntu_tools

if [[ $ppa == "y" ]]; then
    read -p "Install Developer Tools (PHP, Apache, SQL, etc) ? (y/n): " web_dev_tools
    if [[ $web_dev_tools == "y" ]]; then
        read -p "Install Several NodeJS Packages? (Bower, Grunt-CLI, Gulp)? (y/n): " nodejs_packages
    fi
fi

read -p "Create New Group called 'local' (for /usr/local)? (y/n): " local_perms
read -p "Copy dotfiles for your user (.vimrc, .bashrc, etc)? (y/n): " dotfiles


if [[ $ppa == "y" ]]; then
    # This should come first for PPA's
    sudo apt-get install -y python-software-properties

    sudo add-apt-repository -y ppa:git-core/ppa
    sudo add-apt-repository -y ppa:numix/ppa
    sudo add-apt-repository -y ppa:ubuntu-wine/ppa
    sudo add-apt-repository -y ppa:phalcon/stable
    sudo add-apt-repository -y ppa:chris-lea/node.js

    echo "(+) Updating Sources List"
    sudo apt-get update
fi

# Always upgrade after they added PPA's
# If PPA was run, no need to update again
if [[ $ppa != "y" ]]; then
    sudo apt-get update
fi
sudo apt-get upgrade -y

# These are core tools
sudo apt-get install -y\
    vim unzip\
    git mercurial\
    curl htop xclip\
    terminator

if [[ $ubuntu_tools == "y" ]]; then
    sudo apt-get install -y\
        unity-tweak-tool compizconfig-settings-manager compiz-plugins\
        dconf-editor synaptic unetbootin\
        gdebi preload bleachbit ubuntu-restricted-extras\
        numix-gtk-theme numix-icon-theme numix-icon-theme-circle

    cp compizconfig.profile ~
    echo " (+) Make sure to open Compiz and load the compizconfig.profile in ~"

    cp .config ~/.config
    echo " (+) Terminator config added"

fi

if [[ $web_dev_tools == "y" ]]; then
    sudo apt-get install -y\
        meld\
        mysql-server\
        python-dev python-pip\
        php5 php5-dev php5-curl php5-phalcon php5-mysql\
        libsqlite3-dev libpcre3-dev\
        apache2 libapache2-mod-php5\
        redis-server\
        default-jre\
        ruby2.0 ruby2.0-dev\
        nodejs

    # Copy project folder over
    if [ ! -d "~/projects" ]; then
        cp projects ~/projects
    else
        echo " (-) Skipping, ~/projects folder already exists"
    fi

    # Install Phalcon Dev Tools
    sudo ./bin/setup-phalcon-devtools.sh

    # Add PHP Composer
    curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer

    # Permissions for local NPM folder
    sudo chown -R $(whoami) ~/.npm

    if [[ $nodejs_packages ]]; then
        echo "(+) Installing NodeJS Packages."
        sudo npm install bower gulp grunt-cli n -g
    else
        echo "(-) Skipping NodeJS Packages."
    fi
fi

if [[ $local_perms == "y" ]]; then

    # Create user Permissions for usr/local
    sudo groupadd local
    sudo usermod -a -G local $USER
    sudo groupchgrp -R local /usr/local
    sudo chmod -R g+rwx /usr/local
fi

if [[ $dotfiles == "y" ]]; then
    cp .vimrc ~
    cp .bashrc ~
    cp .gitignore ~
    cp .hgignore ~
    cp .gitconfig ~
    cp .exports ~

    # Reload Bash Config
    source ~/.bashrc

    # Instsall Vundle (For VIM Plugins)
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "====================================================================="
echo "                          You are Finished!                          "
echo ""
echo " * You can now remove this directory, or run $ git reset --hard HEAD"
echo "   to cleanup and temporary files created."
echo ""
if [[ $dotfiles == "y" ]]; then
    echo " * To install VIM Addons, please type:"
    echo "----------------------------------------------------------------------"
    echo "   $ vim (This takes you into vim)"
    echo "   :PluginInstall (Just type 'Plugin' and hit <TAB>)"
fi
echo ""
echo " * If you find any issues please report the issue on GitHub:"
echo "   https://github.com/JREAM/config-ubuntu"
echo ""
echo "====================================================================="
echo ""
echo ""