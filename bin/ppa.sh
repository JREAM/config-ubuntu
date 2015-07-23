#/bin/bash
# This should come first for PPA's
sudo apt-get install -y python-software-properties

sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
# Phalcon was moved to the phalcon sh

echo "(+) Updating Sources List"
sudo apt-get update

echo "(+) Sources List Update Complete."
