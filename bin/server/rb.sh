#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Install Ruby 2.3 and Gem Package Manager"
sudo apt-get install -y\
    ruby2.3\
    ruby2.3-dev\
    gem

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Installing RVM and Bundler"

# Install gpg2
command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -

sudo gem install rvm bundler

echo "(+) Sourcing $HOME_PATH/.rvm/scripts/rvm"

source "$HOME_PATH/.rvm/scripts/rvm"

echo "(+) Complete! Run with $ ruby, and $ gem"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
