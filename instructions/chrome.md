## Google Chrome
Version 41 has some annoying issues. It's best to revert to version 40, and Ubuntu does not auto update Chrome without you doing a update.

Stable versions at at: http://mirror.pcbeta.com/google/chrome/deb/pool/main/g/google-chrome-stable/

If you have chrome installed, I'd backup anything if you need it, and remove it *(If you are sync'd, you won't lose anything)*:

    sudo apt-get purge google-chrome-stable
    rm -rf ~/.config/google-chrome

Then install an older version -- This is **40** for a 64-bit OS:

    wget http://mirror.pcbeta.com/google/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_40.0.2214.95-1_amd64.deb

    sudo dpkg -i google-chrome-stable_40.0.2214.95-1_amd64.deb

Then launch it with `$ google-chrome` and you can pin it to a unity bar.