#!/bin/bash
# Variables/Logging
source $PWD/bin/_exports.sh
FILE=$(basename "$0")

if [[ ! $INSTALL_SCRIPT ]]; then
  error "Error: You must use the installer script."; exit
fi

# Argument Required for File
if [ -z "$1" ]; then
  error "Developer Error! Missing Argument for $FILE"
  exit
fi

# Program to install
PROGRAM=$1

case $PROGRAM in
iperf)
  sudo apt-get install -y iperf
  log "Installed iperf; $ iperf -h" success
  ;;
sysbench)
  sudo apt install -y consul
  log "Installed sysbench; $ sysbench -h" success
  ;;
wrk2)
  sudo apt-get install -y \
    build-essential \
    libssl-dev \
    git
  git clone https://github.com/giltene/wrk2.git /tmp/wrk2
  cd /tmp/wrk2 && sudo make
  # move the executable to somewhere in your PATH
  sudo mv /tmp/wrk2/wrk /usr/local/bin && sudo rm -rf /tmp/wrk2
  log "Installed wrk; $ work ( /usr/local/bin; tmp files /opt/wrk2 )" success
  ;;
*)
  error "Developer Error! Invalid \$program for $FILE"
  ;;
esac
