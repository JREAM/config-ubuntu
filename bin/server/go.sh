#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

GO_VERSION="go1.11.5.linux-amd64"

if [[ -d "/usr/local/go" ]]; then
    echo "(!) Your path /usr/local/go already exists, assuming upgrade, clearing folder! (CTRL+C to stop)"
    sudo rm -rf /usr/local/go
    sleep 5
fi

echo "(+) Downloading Google Go: $GO_VERSION"

# Download Time!
#[ ! -d /usr/local/go ] && sudo mkdir /usr/local/go

sudo curl -o /usr/local/go.tar.gz "https://dl.google.com/go/${GO_VERSION}.tar.gz"
  sudo tar zxf /usr/local/go.tar.gz -C /usr/local/ &&\
  sudo rm /usr/local/go.tar.gz

echo "(+) Creating a local ~/go folder for your code. Setting your user permissions."

if [[ ! -d "$HOME/go" ]]; then
    mkdir $HOME_PATH/go
    sudo chown $USER:$USER "$HOME_PATH/go"
fi

echo "(+) Creating a temp file in $PROJECT_TEMP_PATH/append_to_profile.txt"

cat > $PROJECT_TEMP_PATH/append_to_profile.txt <<- EOM
------------------------
-- START INSTRUCTIONS --
------------------------

1: Copy/Paste the text below into:
    ~/.profile
2: Next, apply ENV Variable change  by sourcing:
    $ . ~/profile
3. You should be able to type:
    $ go
    $ go version
----------------------
-- END INSTRUCTIONS --
----------------------



# ---------------------------------------------------
# Google Golang
# ---------------------------------------------------

# Add Go to our path if it exists
if [[ -d "/usr/local/go/bin" ]]; then
    PATH=\$PATH:/usr/local/go/bin
fi

# Include Google go default path if installed
if [[ -d "\$HOME/go" ]]; then
    export GOPATH=\$HOME/go
fi
EOM

echo "Creating Sample Go Project in /go/sample.go"
# Create sample project


cat > $HOME_PATH/go/sample.go <<- EOM
package main

import "fmt"

func main() {
    fmt.Printf("hello, world")
}
EOM


echo "(+) Complete! Go was installed!"
echo "(!) Required: Read the instructions in this file to finish setup:"
echo "      $ cat $PROJECT_TEMP_PATH/append_to_profile.txt"
echo "      $ source ~/.profile"
echo ""
echo "(!) Then attempt to build the Hello World item:"
echo "      $ cd ~/go/ && go build sample && ./sample"
echo ""
echo "(!) If you have issues, please check the following:"
echo "       $ which go"
echo "       $ echo \$GOPATH"
echo "    Nethier of those should be empty."
echo "       $ tail ~/.profile   -- Did you add to your ~/.profile and source it?"
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 6
fi

