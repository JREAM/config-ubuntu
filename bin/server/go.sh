#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading Google Go lang"


sudo apt-get install -y golang-go

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Use with $ go"
echo "(+) Located: /user/local/go/bin"
echo ""
echo "(!) If you are NOT using the provided .profile, add to yours:"
echo ""
echo 'if [ -d "/usr/local/go/bin" ]; then'
echo '    export GOROOT="/usr/bin/'
echo '    export GOPATH=$HOME/.go'
echo 'fi'


sudo mkdir "$HOME/.go"
sudo chown $USER:$USER "$HOME_PATH/.go"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

