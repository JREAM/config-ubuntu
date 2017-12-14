#!/bin/bash

sudo apt install grc

git clone https://github.com/garabik/grc.git
cd grc
sudo ./install.sh
rm -rf grc
