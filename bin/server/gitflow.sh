#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Git (If Not Installed); Git-Flow; Bash-Completions (If Not Installed)"

sudo apt-get install git git-flow bash-completion -y

echo "(+) Copying git-flow-completion.bash to Your Home Folder"
cp $FILES_DIR/git-flow-completion.bash $USER_HOME/git-flow-completion.bash
# Clear any existing tmp GO files

echo "(+) Complete! Git-flow was installed!"
echo "      $ source ~/.bashrc"
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 6
fi

