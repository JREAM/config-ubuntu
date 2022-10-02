#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

sudo apt install -y \
  default-jre \
  default-jdk


if [ -x /usr/bin/java ]; then
  log "Package: java-11-jre installed, $ java"
else
  log "Package: java-11-jre not found in /usr/bin/java"
fi

if [ -d /usr/lib/jvm/java-11-* ]; then
  log "Package: java-11-openjdk installed."
  log "Add To your \$PATH: export PATH=\$PATH:/usr/lib/jvm/java-11-openjdk-amd64/bin/java/bin"
else
  log "Package: java-11-openjdk not found in /usr/lib/jvm/java-11-openjdk-amd64, please check your path or re-install".
fi
