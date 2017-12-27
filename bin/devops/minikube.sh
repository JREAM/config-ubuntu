#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Keys
echo "(+) Installing Minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

echo "(+) Complete: Run with $ minikube"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
