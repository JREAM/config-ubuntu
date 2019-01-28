#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Install (RBENV) Ruby Version Manager"

# Dependencies
sudo apt-get install -y\
  autoconf\
  bison\
  build-essential\
  libssl-dev\
  libyaml-dev\
  libreadline6-dev\
  zlib1g-dev\
  libncurses5-dev\
  libffi-dev\
  libgdbm5\
  libgdbm-dev

git clone https://github.com/rbenv/rbenv.git ~/.rbenv &&\
git clone https://github.com/rbenv/ruby-build.git $HOME_PATH/.rbenv/plugins/ruby-build

sudo chown -R $USER:$USER $HOME_PATH/.rbenv
# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Make sure to add the following:"
echo ""
echo "    export PATH=\"$HOME/.rbenv/bin:$PATH\"' >> ~/.bashrc"
echo "    eval \"\$(rbenv init -)\"\' >> ~/.bashrc"
echo "(+) Once complete, source bashrc and here's an example:"
echo "    $ source ~/.bashrc"
echo "    $ rbenv install 2.5.3"
echo "    $ rbenv global 2.5.3"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
