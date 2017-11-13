#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing pipenv"

if hash pip 2> /dev/null; then
  sudo -H pip install pipenv
else
  print "Error: Pip not installed with Python"
  exit 1
fi

echo "(+) Complete! Run with $ pipenv"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
