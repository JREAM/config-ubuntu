#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


git clone https://github.com/ekalinin/pip-bash-completion.git
sudo mv ./pip-bash-completion/pip /etc/bash_completion.d/

echo "Complete, please source the file:"
echo -e " $ . /etc/bash_completion.d/pip"
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 3
fi

