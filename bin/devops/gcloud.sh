#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Adding Apt Repo for: Google Cloud SDK (gcloud)"

VERSION="207.0.0"

wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$VERSION-linux-x86_64.tar.gz
tar -zxvf google-cloud-sdk-$VERSION-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh

cat << EOF
(+) Complete! To get started with google-cloud-sdk run:
    $ gcloud init
EOF

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
