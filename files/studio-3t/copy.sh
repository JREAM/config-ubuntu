#!/bin/bash

# This will replace the user with your /home/yourusernow
echo -e "[+] Replacing desktop short user to you: ${USER}"

sed -i "s/<REPLACE>/${USER}/g" ./studio-3t.desktop

echo -e "[+] Copying to ~/.local/share/applications/studio-3t.desktop"
echo -e "[+] Copying to ~/.local/share/icons/studio-3t.png"
echo ""

cp studio-3t.desktop ~/.local/share/applications/
cp studio-3t.png ~/.local/share/icons/

echo -e "[+] Done, try to find it in your apps, 'Studio 3T'";
echo -e "\t Or under the category Development"
echo ""
echo -e "\t If you cannot find, first: "
echo -e "\t $ cat ~/.local/share/applications/studio-3t.desktop"
echo ""
echo -e "\t ensure it has the correct paths.( You cannot use ~ or variables)"


