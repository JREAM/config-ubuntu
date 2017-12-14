#!/bin/bash

VERSION="2.2.1"


# Since this could interfere with the CLI itself, make it lhe long version
if [[ $1 == '--update' ]]; then
  echo -e "Downloading ${PACKAGE} to this ${PWD}"
  wget -c "https://oss.sonatype.org/content/repositories/releases/io/swagger/swagger-codegen-cli/$VERSION/swagger-codegen-cli-$VERSION.jar"
  exit 1
fi

# Create a symlink to this file (shorten the java command)
if [ ! -e /usr/local/bin/swagger-codegen ]; then
  echo "[+] creating up a symlink to /usr/local/bin/swagger-codegen"

  if [ ! -f swagger-codegen* ]; then
    echo -e "[!] You must first get the swagger-codegen-cli JAR file, please run: $ ./init --update"
    exit 1
  fi

  sudo ln -s /home/jesse/apps/swagger-codegen/init.sh /usr/local/bin/swagger-codegen
  echo "[+] Done! run with: $ swagger-codegen help"
  exit 1
fi


# Run the Tool
java -jar "${PWD}/swagger-codegen-cli-$VERSION.jar"
