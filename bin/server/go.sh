#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION="go1.16.5.linux-amd64"

if [[ -d "/usr/local/go" ]]; then
    echo "(!) Your path /usr/local/go already exists, assuming upgrade, clearing folder! (CTRL+C to stop)"
    sudo rm -rf /usr/local/go
fi

echo "(+) Downloading Google Go: $VERSION"

# Download Time!
#[ ! -d /usr/local/go ] && sudo mkdir /usr/local/go

echo "[+] Downloading Go $VERSION"
sudo curl -o /usr/local/go.tar.gz "https://dl.google.com/go/${VERSION}.tar.gz"
sudo tar -C /usr/local -xzf /usr/local/go.tar.gz
sudo rm /usr/local/go.tar.gz

echo "[+] Adding /etc/bash_completion.d/go"
sudo curl -o /etc/bash_completion.d/go "https://raw.githubusercontent.com/kura/go-bash-completion/master/etc/bash_completion.d/go"

# Now we need the USER to setup:
cat > $HOME_PATH/golang-update-profile.txt <<- EOM

(1) https://golang.org/doc/install

[ STEP 1 ]
  [ Option A ]
  Copy the code below into ~/.profile

  [ Option B ]
  If you prefer to do as I do, I paste my "vendor data" into a
  ~/.bash_vendors which is loaded from ~/.bashrc like this:

  # (This is .bashrc, the code to copy/paste goes into ~/.bash_vendors)
  [[ -f ~/.bash_vendors ]] && source ~/.bash_vendors


# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >> START: COPY CODE

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

# >> END: COPY CODE
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# [ STEP 2 ]
# You must source your file, or load a new terminal to apply the $PATH.
# Once your .profile (or .bashrc, whiever you choose) is set, please run the follwing:
#
$ source ~/.profile    # (or source .bashrc)
$ go && echo $GOPATH


You should have no errors.
# [ STEP 3] Optionally, test code.
cd $GOPATH/src &&\
  echo -e "package main\n\nimport \"fmt\"\n\nfunc main() {\n  fmt.Printf(\"hello, world\")\n}" > hello.go &&\
    go build hello.go &&\
    ./hello

# You should get the output "hello, world". Otherwise please read:
- https://golang.org/doc/install#testing

EOM

read -e -p  "[?] To finish, please follow the simple THREE (3) steps saved in $HOME/golang-update-profile.txt, then press
  ANY KEY to acknowledge this message" completed


if [ $SKIP_SLEEP == false ]; then
    sleep 6
fi
