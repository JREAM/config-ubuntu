#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Keys
echo "(+) Installing Kubernetes ($ kubtectl)"

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl

echo "(+) Complete! Run with $ kubectl"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
