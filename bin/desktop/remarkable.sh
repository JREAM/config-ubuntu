#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Create user Permissions for usr/local
echo "(+) Downloading Remarkable (Markdown App)"
wget https://remarkableapp.github.io/files/remarkable_1.87_all.deb -P $PROJECT_TEMP_PATH

sudo dpkg -i "$PROJECT_TEMP_PATH/remarkable_1.87_all.deb"
sudo apt-get install -y -f

rm "$PROJECT_TEMP_PATH/remarkable_1.87_all.deb"


echo "(+) Complete! "
echo "(+) To run, type: $ remarkable"
echo "(+) Check your Applications menu for Remarkable too!"
echo ""
echo "    For More Info see: https://remarkableapp.github.io"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
