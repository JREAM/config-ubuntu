#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing Chrome via PPA"

sudo add-apt-repository -y ppa:alessandro-strada/ppa
sudo apt update && sudo apt install google-drive-ocamlfuse -y

echo -e "\n(+) Complete1"

echo "\n\n<<< PLEASE READ:\n\t$HOME/google-drive-fuse.md TO FINISH SETUP! >>>\n\n"

cat <<EOF >> $HOME/google-drive-fuse.md"

# Google Drive Remote

> This does NOT download files to your desktop, it streams them.

## Enable It

- Step 1: Authenticate
  - Run from command line: `google-drive-ocamlfuse`
- Step 2: Make a folder (anywhere) to mount
  - `google-drive-ocamlfuse ~/google-drive`

## Disable/Unmount

- Step 3: To unmount you must use **fuse** like this:
  - `fusermount -u ~/google-drive`
- Step 4: You can disable under your Google Account, or a quick link:
  - https://myaccount.google.com/permissions

"


if [ $SKIP_SLEEP == false ]; then
    sleep 8
fi
