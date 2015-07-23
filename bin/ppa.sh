#/bin/bash
# This should come first for PPA's

sources=(git-core numix ubuntu-wine)

echo "(+) Removing and Re-Adding Sources List"

for s in $sources; do
    if [ -f /etc/apt/sources.list.d/$s*ppa ]; then
        sudo rm /etc/apt/sources.list.d/$s*ppa
    fi
    sudo add-apt-repository -y ppa:$s
done

echo "(+) Updating Sources List"
sudo apt-get update

echo "(+) Sources List Update Complete."
