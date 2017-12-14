#!/bin/bash

# To install Cinammon on Ubuntu 16 run:
# sudo apt install cinammon-desktop

# This is to reset defaults
# dconf reset -f /org/cinnamon/


dconf dump /org/cinnamon/ > my-cinnamon-settings


