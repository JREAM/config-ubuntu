#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

if hash pip3 2>/dev/null; then
  pip3 install awscli
else
  echo "You need Python 3 installed for awscli tools"
  echo "If you are using Pyenv with Pip alrady, run: $ pip3 install awscli"
  exit 1
fi

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Use with $ aws"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
