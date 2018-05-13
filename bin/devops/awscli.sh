#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

if hash pip3 2>/dev/null; then
  pip3 install awscli
else
  echo "You need Python 3 installed for awscli tools"
  exit 1
fi

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Use with $ aws"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
