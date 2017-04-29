#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Azure CLI 2.0."

cat << EOF
(!) Important:
    Two Prompts ask where to place 'bin' & 'lib'.
    I Recommend both Paths to be the same such as:
         ~/azure
      or ~/apps/azure

    After this, it will want to update your ~/.bashrc, after completion please
    source your bashrc and double check it:
    $ . ~/.bashrc

(!) This is not the cleanest installer in my opinion, but it works.
    APT does not work on Ubuntu 16+ right now, it cannot find the sources.
EOF

read -p "Press enter to continue, or press CTRL+C to cancel installing."

echo "(+) Downloading Installer and Running"
curl -L https://aka.ms/InstallAzureCli | bash

echo "(+) Attempting to Reload your Shell"
exec -l $SHELL

echo "(+) Attempting to source your .bashrc (You may need to manually)"
source $HOME_PATH/.bashrc


cat << EOF
(+) Complete! To get started with azure-cli run:
    $ az
EOF


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
