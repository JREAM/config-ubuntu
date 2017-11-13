# Config Ubuntu

Bash scripts to quick install in Linux Ubuntu. This is primarily for [Ubuntu](http://ubuntu.com/desktop) 16+ Desktop and/or Server.
Also, for anything GUI related I will focus on Gnome as a UI because I never liked Unity or KDE.

> Terminal Help Has been moved: [https://github.com/JREAM/ubuntu-cheatsheet](https://github.com/JREAM/ubuntu-cheatsheet)

<!-- TOC -->

- [Config Ubuntu](#config-ubuntu)
    - [This Repository Usage](#this-repository-usage)
        - [Install](#install)
        - [Simple File Structure](#simple-file-structure)
        - [Bulk Install](#bulk-install)
- [Grub](#grub)
    - [Change Boot Order](#change-boot-order)
- [Dotfiles](#dotfiles)
- [Tweaking Gnome UI](#tweaking-gnome-ui)
- [Utilities](#utilities)
    - [Configure: Redshift for Eyestrain](#configure-redshift-for-eyestrain)
        - [Dependency: RedShift GeoClue](#dependency-redshift-geoclue)
        - [USB Maker: Linux ISO to USB](#usb-maker-linux-iso-to-usb)
        - [USB Maker: Windows ISO to USB](#usb-maker-windows-iso-to-usb)
- [SSH Management](#ssh-management)
    - [SSH Key Location and Permissions](#ssh-key-location-and-permissions)
    - [Permissions: SSH Folder](#permissions-ssh-folder)
    - [Permissions: Authorized_Keys](#permissions-authorizedkeys)
    - [Create: SSH Key](#create-ssh-key)
    - [Permissions: SSH Key](#permissions-ssh-key)
    - [Add: SSH Key to SSH-Agent](#add-ssh-key-to-ssh-agent)
    - [Convert: PPK to SSH Key](#convert-ppk-to-ssh-key)
- [GUI](#gui)
    - [Numix Icon Theme](#numix-icon-theme)
    - [Windows Apps: Wine](#windows-apps-wine)
        - [64-Bit Installations (Recommended)](#64-bit-installations-recommended)
        - [32-Bit Installations](#32-bit-installations)
        - [Other Options](#other-options)
- [LAMP](#lamp)
    - [Install PHP](#install-php)
        - [PHP: Install Primary Modules](#php-install-primary-modules)
            - [PHP: Enable Primary Modules](#php-enable-primary-modules)
            - [PHP: Install Redis Module](#php-install-redis-module)
            - [PHP: Redis Module Dependencies](#php-redis-module-dependencies)
            - [PHP: Redis, Update PEAR Channels](#php-redis-update-pear-channels)
            - [PHP: Redis Install PHP Extension](#php-redis-install-php-extension)
            - [Redis: Create Extension INI](#redis-create-extension-ini)
    - [PHP: Phalcon Extension](#php-phalcon-extension)
        - [PHP: Phalcon Dev-Tools](#php-phalcon-dev-tools)
    - [Apache2](#apache2)
        - [Install: Common Modules](#install-common-modules)
        - [Search: Any Modules](#search-any-modules)
    - [Nginx](#nginx)
    - [MySQL](#mysql)
        - [MySQL: Utility MyCLI](#mysql-utility-mycli)
    - [Secure Permissions](#secure-permissions)
    - [Python](#python)
    - [Ruby](#ruby)
    - [NodeJS](#nodejs)
        - [Upgrade](#upgrade)
    - [Java](#java)
        - [Java: Install Default](#java-install-default)
        - [Java: To install OpenJDK](#java-to-install-openjdk)
        - [Java: Install Oracle JDK](#java-install-oracle-jdk)
- [Install Gnome](#install-gnome)
    - [Fix: Sound Indicator Not Showing](#fix-sound-indicator-not-showing)
    - [Improve: Easy Window Resize](#improve-easy-window-resize)
    - [Improve: Left or Right Close Buttons](#improve-left-or-right-close-buttons)
    - [Fix: Gnome Lockscreen](#fix-gnome-lockscreen)
    - [Fix: Touchpad When Typing](#fix-touchpad-when-typing)
    - [Fix: Gnome Freeze](#fix-gnome-freeze)
    - [Improve: Adjust Mouse and Devices](#improve-adjust-mouse-and-devices)
    - [Preserve Settings](#preserve-settings)
- [Virtual Machine](#virtual-machine)
    - [Global Configuratioh Locations](#global-configuratioh-locations)
    - [Speed up Guest Machine](#speed-up-guest-machine)
    - [Fix Mouse Side Buttons in VMWare](#fix-mouse-side-buttons-in-vmware)
    - [Fix Copy/Paste From Host and Guest](#fix-copypaste-from-host-and-guest)
    - [Speed up Mouse Wheel](#speed-up-mouse-wheel)
    - [Vagrant VBGuest Fix:](#vagrant-vbguest-fix)
    - [Windows 8 VirtualBox Fix](#windows-8-virtualbox-fix)
    - [Install ATI Drivers](#install-ati-drivers)
    - [Remove ATI Drivers](#remove-ati-drivers)
- [Chrome Addons](#chrome-addons)
- [Other Applications](#other-applications)
- [Fix](#fix)
    - [Bad Superblock to Busybox initramfs](#bad-superblock-to-busybox-initramfs)

<!-- /TOC -->

## This Repository Usage

### Install

Ensure you have `git` installed. Then, Run the following to clone and update the `dotfiles` submodule:
```
git clone https://github.com/JREAM/config-ubuntu.git
cd config-ubuntu && git submodule init && git submodule update
```

Now, you are able to run a script, eg: `./desktop.sh` which will provide many options.

### Simple File Structure

- **Run a main script file**:
- `sudo ./desktop.sh` Options to install desktop items.
- `sudo ./server.sh` Options to install server items, _(you can do this on your desktop also.)_
- `sudo ./devops.sh` Options to install devops items, _(you can do this on your desktop also.)_

> **Important**: You must run from a main script _(above)_, otherwise paths and variables would incorrect.
There is a built in check to prevent this as well.

### Bulk Install
If you prefer to not use the selection scripts you can use the `autoinstall.sh` and provide any packages you like
found within the `/bin` directory.

Now you can run an instant install with the `instant-install.sh` file.

- Edit `autoinstall.sh` in any text editor.
- Go down to the `autoinstall` array.
- Remove the `#` before any items you want to install, or add new ones.

Once ready, run the script:
```sh
sudo ./autoinstall.sh
> You will be prompted to confirm.
```

***

[(Back to top)](#table-of-contents)

# Grub
Grub is the Linux Bootloader to select which drive or partition to boot into. This doesn't apply so much for Virtual Machines.

## Change Boot Order
If you are running Grub as your default boot-loader, you can use this application to make it easier to change the order.

```sh
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update && sudo apt-get install grub-customizer
```

> **Run Grub Customers**: Search Applications for `grub customerizer` or from terminal run `gksudo grub-customizer`.

- 1) In the application go to the `General Settings` tab, and you'll see **default entry**.
- 2) Click the drop-down list and you can either select Entry By Order (Left Column) Or a specific Item (Right Column).
- 3) If you are dual booting Windows and want Windows the default, Select the right column for Windows.
- 3) The reason is if more items are added, perhaps new kernels, then if Position 5 which held Windows will no longer be the default.

***

[(Back to top)](#table-of-contents)

# Dotfiles

Included in the repository are dotfiles which go into `$HOME/`. These are updated with better features and tools often,
so I cannot keep a list of every feature here.

# Tweaking Gnome UI

I no longer use Unity, I have never liked it.
This is for tweaking the UI

```sh
sudo apt-get install -y gnome-tweak-tool
```

With tweak tool installed, you may use Firefox or Chrome and head over to [https://extensions.gnome.org/](https://extensions.gnome.org/)
to begin adding plugins.

> If you still get an error on the Extension site, try running `apt install chrome-gnome-shell` and restarting Chrome.

***

[(Back to top)](#table-of-contents)

# Utilities

These are some common items I enjoy using

|Package|Skill Level|Description|
|--|--|--|
| **Must Haves** | |
| meld | Easy | File Comparison Tool _(Similar to WinMerge)_ |
| curl | Easy | Download, Make API Calls, used all the time. |
| htop | Easy | A colored Process Manager superior to `top` |
| xclip | Medium | A chainable utility to copy text |
| unzip | Easy | Terminal to run `unzip` on a zip archive |
| redshift | Easy | Terminal Based tool for helping eye strain |
| redshift-gtk | Easy | GUI For Helping eye strain |
| terminator | Easy | Awesome replacement for default terminal, tabbable/splittable windows and much more |
| git | Medium | Version Control |
| vim | Advanced | Terminal editor which has a steep learning curve but well worth it. The easy alternative is `nano` or `pico`. |
| **System Tools** | |
| gdebi | Easy | Light-weight alterntaive to Software Installer UI, more reliable |
| dconf-editor | Advanced | Used to change `gsettings` with a GUI; Or modifiying the `dconf` database. |
| synaptic | Advanced | Used as a Package manager for your entire OS. |
| bleachbit | Easy | System Cleaner _(Similar to CCLeaner)_ |

> **Note**: These are purely Linux tools, there are many fantastic Node, Python, and other packages as well.

***

[(Back to top)](#table-of-contents)

## Configure: Redshift for Eyestrain

Install the following, you will most likely have to edit the GeoClue configuration which is right after this section.
```sh
sudo apt-get -y install redshift redshift-gtk geoclue-2.0
```

Create your configuration file:
```sh
sudo vim ~/.config/redshift.conf
```

Also it may help to install the `gtk` Top Panel icon with an AutoStart/Close setting. This is found in your Applications.
However, to adjust the temperatures (Screen Light) you have to edit/create the following:

```sh
vim ~/.config/redshift.conf
```

Toggle and adapt these settings to your own preference.
```conf
[redshift]
temp-day=3500
temp-night=3500
; Set the screen brightness. Default is 1.0.
;brightness=0.9
; It is also possible to use different settings for day and night
;brightness-day=0.7
;brightness-night=0.4
; There are more settings for Gamma, Location Provider, Manual Location, etc.
```

***

[(Back to top)](#table-of-contents)

### Dependency: RedShift GeoClue

> **Important** You most likely have to update `geoclue`, or may receive an error &mdash; Relax! So do this following:

```sh
apt install geoclue-2.0
sudo vim /etc/geoclue/geoclue.conf
```

Now, append the following to the bottom of `geoclue.conf` file to apply it to redshift:

```conf
[redshift]
allowed=true
system=false
users=
```

To apply the changes simply run:
```sh
pkill redshift-gtk && pkill redshift && redshift-gtk
```

> **Special Note**: In the unlikely event you are working with GTK Libraries for development you may encounter an error.

***

[(Back to top)](#table-of-contents)

### USB Maker: Linux ISO to USB
This is a great tool, easy to install and use:
```
sudo apt-get install unetbootin
```

Load the program from searching your Applications for `unetbootin`

***

[(Back to top)](#table-of-contents)

### USB Maker: Windows ISO to USB

> **Important** This currently seems to be problematic.
You may want to look in your Applications for `Startup Disk Creator`, otherwise attempt the following.

 You can easily use `Startup Disk Creator` and `UNetbootin` to create Linux to USB. But if you need Windows to USB from
your Linux OS use Win USB:

```sh
sudo add-apt-repository ppa:colingille/freshlight
sudo apt-get update
sudo install -y winusb
```

If the above fails, get your OS Codename with `(lsb_release -cs)`, then copy the name and try changing the apt file:
```sh
vim /etc/apt/sources.list.d/olingille-freshlight
````

We replace the sources.list back to saucy in order to get it to work for ubuntu 14, that is the purpose of the `sed` command.

***

[(Back to top)](#table-of-contents)

# SSH Management

SSH Keys are used for server authentication among other things. At some points you will want one or many. It's very important
to keep your secret key private. You'll see more under "Creating an SSH Key".

## SSH Key Location and Permissions

Quick SSH Permission Cheat Sheet

| File | Permission | Command |
|--|--|--|
| `~/.ssh` | `700` | `chmod 700 ~/.ssh` |
| `~/.ssh/keyname_rsa` | `600` | `chmod 600 ~/.ssh/keyname_rsa` |
| `~/.ssh/keyname_rsa.pub` | `644` | `chmod 644 ~/.ssh/*.pub` |
| `~/.ssh/authorized_keys` | `644` | `chmod 644 ~/.ssh/authorized_keys` |

---

> **Note**: An Environment variable appears as `$NAME`, there are many pre-defined ones in Linux to save you from
having to know an absolute value. `echo $HOME` would provide you the current users home directory. `echo $USER` is
another one that's very common.

> **Tip**: You can also reference the current users home folder with `~/.ssh` rather than `$HOME` if you like.

***

[(Back to top)](#table-of-contents)

## Permissions: SSH Folder

Create a folder in your `Home Directory` folder called `.ssh`, assuming it does not exist.
Your SSH folder is located at `/home/<your_user>/.ssh`, it may or may not exist.
```sh
mkdir $HOME/.ssh && cd $HOME/.ssh && chmod 700 $HOME/.ssh
chmod -R 700 $HOME/.ssh
```

***

[(Back to top)](#table-of-contents)

## Permissions: Authorized_Keys
Authorized Keys are usually on a server which allow you to SSH into, they contain your `.pub` key. Let's ensure we only
create a file if one does not exist:
```sh
if [ ! -f $HOME/.ssh/authorized_keys ]; then touch $HOME/.ssh/authorized_keys; fi
chmod 644 $HOME/.ssh/authorized_keys
```

***

[(Back to top)](#table-of-contents)

## Create: SSH Key

Your SSH key works as follows:
- Never share your private key, this has **no** extension.
- Use your public key for any services you please, this has a `.pub` extension.

> **Recommended**: Create this within your `~/.ssh/` folder.
```sh
ssh-keygen -t rsa -b 4096 -f your_keyname_rsa
> You do not have to suffix '_rsa' to your key, I do it to remember the encryption type.
> Optionally you can provide a password when prompted, leave empty to not require one.
```

***

[(Back to top)](#table-of-contents)

## Permissions: SSH Key

This can be simple by first applying the `private key` permissions, and after that the `public key` permissions.
```sh
# 1. For Private Keys (This should be fine if you have an authorized_keys file, otherwise use 644)
# 2. For Public Keys
chmod -R 600 $HOME/.ssh/
chmod -R 644 $HOME/.ssh/*.pub
```

***

[(Back to top)](#table-of-contents)

## Add: SSH Key to SSH-Agent

You SSH Key will not always be added to the SSH-Agent. You add your private key to the agent. To do this simply run:
```sh
ssh-add $HOME/.ssh/yourkeyname
```

If you get an error, here are two resolutions:
1. Ensure your permissions are correct (See above)
2. Re-instantiate the agent with `eval $(ssh-agent)`, you should see something like `Agent pid 1234`.

***

[(Back to top)](#table-of-contents)

## Convert: PPK to SSH Key

Install `putty-tools` with `sudo apt install putty-tools`.

In order To convert a `*.ppk` (Putty Key) to an SSH or EC2 (Amazon) valid key do the following.

```sh
puttygen your_key.ppk -O private-openssh -o id_dsa
puttygen your_key.ppk -O public-openssh -o id_dsa.pub
```

Next, ensure it is in your SSH folder with proper permissions _(Use your real key name)_:
```sh
mv -i ~/id_dsa* ~/.ssh
chmod 600 ~/.ssh/id_dsa && chmod 644 ~/.ssh/id_dsa.pub
```

You may also want to ensure this is added to the SSH Agent;
```sh
ssh-add ~/.ssh/id_dsa
```

***

[(Back to top)](#table-of-contents)

# GUI

## Numix Icon Theme

Numix for your GUI Icons is extremely popular, to install add the PPA:
```sh
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install -y numix-gtk-theme numix-icon-theme numix-icon-theme-circle
```

Next, use the **Tweak Tool** from your Applcations (`gnome-tweak-tool`) to adjust your icons to Numix.

***

[(Back to top)](#table-of-contents)

## Windows Apps: Wine
You can run various Windows Applications on Linux using Wine. I often use [HeidiSQL](https://www.heidisql.com/) with Wine.
To install add the ppa for 1.7, otherwise use 1.6.

### 64-Bit Installations (Recommended)
```sh
sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo apt-get install -y wine1.7-amd64
```

### 32-Bit Installations
```sh
sudo apt-get install -y wine1.7-i386
```

### Other Options
To use the default shipped with your OS simply run:

```sh
sudo apt-get install wine
```

***
[(Back to top)](#table-of-contents)

# LAMP
Linux Apache MySQL PHP

**- Installation for the following:**
- PHP (and Modules)
- Apache 2.4 (and Modules)
- Nginx *(Optional)*
- MySQL
- Redis
- and Header Files.

## Install PHP

> **Note**: PHP 7.x Ships with Ubuntu >17, but for 16 we must add a PPA.

```sh
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
```

It's important to install **php7-dev** if you want to compile any add-ons later. We also want composer (PHP Package Manager)
to be installed globally and accessible via `$ composer`

The bare basics will be the following (Below can be replaced with `7.0` or `7.1` or `7.2`):
```sh
sudo apt-get install -y php7.1 php7.1-dev libpcre3-dev
curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer
```

> **Location**: You PHP Configuration will be in `/etc/php/<version>/cli/php.ini` and `/etc/php/apache2/cli/php.ini`

If you are looking for more PHP modules try:
```sh
sudo apt-cache search php7.1-
```

### PHP: Install Primary Modules
You do not need `cgi` or `fpm` if using Nginx, however I will include them just incase you use nginx.

```sh
sudo apt-get install -y \
  php7.1-{bz2,cgi,cli,common,curl,dev,fpm,gd,imap,intl,json,mbstring,mcrypt,mysql,opcache,readline,xml,xmlrpc,zip}
```

#### PHP: Enable Primary Modules
```sh
sudo phpenmod bz2 cli cgi curl dev fpm gd imap intl json mbstring mcrypt mysql opcache readline xml xmlrpc zip
```

#### PHP: Install Redis Module

The Redis module doesn't come by default, so we must use `PECL` to install it. You also need `build-essential` and few
other build tools which you should have installed regardless of this module.

#### PHP: Redis Module Dependencies
Ensure we also have php7.x-dev, whichever version you use.

```sh
sudo apt-get install -y redis-server php7.1-dev
sudo apt-get install -y build-essentials gcc make autoconf libc-dev pkg-config
```

#### PHP: Redis, Update PEAR Channels

```sh
sudo pear channel-update pear.php.net
sudo pecl channel-update pecl.php.net
```

#### PHP: Redis Install PHP Extension
```sh
sudo pecl install redis
```

You will be asked:
```sh
> enable igbinary serializer support? [no] :
```

Type `no` or press `<enter>`

#### Redis: Create Extension INI
```sh
echo "extension=redis.so" > redis.ini && sudo mv redis.ini /etc/php/7.1/mods-available
sudo phpenmod redis
```

> **Bonus Tip**: To update PEAR packages run `pear upgrade-all`. Additionally, to see all available packages run `pear remote-list`, and
give it a good 30 seconds or more to populate a very long list. It may be useful to run `pear remote-list > pear-list.txt` so you can read it
as it's somewhat long.

## PHP: Phalcon Extension
Phalcon is the fastest PHP Framework. It's fantastic and I've used it for several years.

```sh
sudo apt-add-repository ppa:phalcon/stable
sudo apt-get update

# Ensure you use the PHP Version you are currently using
sudo apt-get install -y php7.1-phalcon
sudo phpenmod phalcon
```

### PHP: Phalcon Dev-Tools
This allows a nice set of features as well as a CLI tool, more here: [https://github.com/phalcon/phalcon-devtools](https://github.com/phalcon/phalcon-devtools)

## Apache2

- **Locations**
- `cd /etc/apache2/apache.conf`
- `cd /etc/apache2/mods-available`
- `cd /etc/apache2/mods-enabled` _(Symlinks)_
- `cd /etc/apache2/sites-available`
- `cd /etc/apache2/sites-enabled` _(Symlinks)_

You must install `libapache2-mod-php7.1` _(or the version of php you are using)_.
```sh
sudo apt-get install -y apache2 libapache2-mod-php7.1
sudo a2enmod php7.1 && sudo service apache2 reload
```

### Install: Common Modules
Ensure we are using `mpm_preform` and enable a few common modules.

```sh
sudo a2dismod mpm_event mpm_preform
sudo a2enmod mpm_preform rewrite headers auth_basic
```

### Search: Any Modules
If you are looking for more Apache modules try:
```sh
sudo apt-cache search libapache2-mod-
```


## Nginx

- **Locations**
- `cd /etc/nginx/nginx.conf`
- `cd /etc/nginx/sites-available`
- `cd /etc/nginx/sites-enabled` _(Symlinks)_

Simply Install this lightweight beauty easily:
```sh
sudo apt-get install -y nginx
```

## MySQL

```sh
sudo apt-get install -y mysql-server

# For outside connections run the following:
sudo sed -i 's/bind-address/bind-address = 0.0.0.0#/' /etc/mysql/my.cnf
```

### MySQL: Utility MyCLI

This is a very nice utility in Python [https://github.com/dbcli/mycli](https://github.com/dbcli/mycli)

```sh
pip install mycli
```

For Usage, sSee the documents from the git link above for more examples:
```sh
mycli -h localhost -u root
mycli -h localhost -u root -p
```

## Secure Permissions
We will use the Access Control Lists (ACL) or (Filesystem Access Control List). We will use group permissions for folders so you don't have to make the public writable, because `777` is dangerous.

```sh
# Make sure you have ACL installed
sudo apt-get install -y acl
```

Look for your main partition with:
```sh
df
```

Mine happens to be `dev/root`, yours may be `dev/sda` or something. Make sure to replace that below:
```sh
sudo /sbin/tune2fs -o +acl /dev/root
```

To see what file system you are using `ext3`, `ext4`, etc, use the partition:
```sh
sudo file -sL /dev/root
```
We have to put the partition in read-only mode, then remount it:
```sh
sudo /bin/mount -o remount /dev/root
```

Apply Group
```sh
# This sets the Defaults
setfacl -Rd g:www-data:rw /var/www
# This sets future file
setfacl -Rm g:www-data:rw /var/www
```

To Modify
```sh
setfacl -Rm g:www-data:rw /var/www
```

Otherwise you could always set up a crontab such as:
```sh
crontab -e
```

Then append this to run every five minutes.
```sh
*/5 * * * * /home/ramesh/backup.sh chgrp -R www-data /var/www && chmod g+rw /var/www
```
Lastly, you could have a deploy script that does this for you, such as Python `Fabfile`, but that's another topic.


***

[(Back to top)](#table-of-contents)

## Python

Python is installed by default on Ubuntu, version 2.7 is suitable. I strongly recommend installing `python-dev` for headers to compile certain PIP packages.

```sh
sudo apt-get install -y python-dev
sudo apt-get install -y python-pip
sudo pip install fabric virtualenv virtualenvwrapper
```sh

If you plan on using SSL or PIL(Pillow) for Image manipulation,  I'd have these dependencies pre-installed:
```sh
sudo apt-get install -y\
  libssl-dev\
  libffi-dev\
  libjpeg8-dev\
  libjpeg-dev
```

Note: Some programs use `libffi` (Foreign Functions Interface) and need the dev headers to build from it, as well as the other dev packages, yet FFI just looks funny to read.

***
[(Back to top)](#table-of-contents)

## Ruby
Install Ruby 2.X with header files in `ruby2.3-dev`, this will keep your gems from having issues.

```sh
sudo apt-get install -y\
  ruby2.3\
  ruby2.3-dev\
  gems
```

For Ruby RVM (Version Management)
```sh
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
```

***
[(Back to top)](#table-of-contents)

## NodeJS
I am using a PPA to fix the nodejs path issue(s)
```sh
sudo apt-get install -y nodejs
sudo chown -R $(whoami) ~/.npm
```

### Upgrade

Clear NPM's cache:
```sh
sudo npm cache clean -f
```

Install a helper called `n`
```sh
sudo npm install -g n
```

Install latest stable NodeJS version
```sh
sudo n stable
```

Or pick a specific version:
```sh
sudo n 8.9.1
```

***
[(Back to top)](#table-of-contents)

## Java
I use the default JRE/JDK, the others are up to you.

### Java: Install Default
```sh
sudo apt-get install -y\
  default-jre default-jdk
```
### Java: To install OpenJDK
```sh
sudo apt-get install -y\
  openjdk-8-jdk
  openjdk-8-jre
```

### Java: Install Oracle JDK
```sh
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get install -y oracle-java8-installer
```

# Install Gnome

If you prefer Gnome 3 over the Unity desktop it's easy to install:

```sh
sudo apt-get install -y ubuntu-gnome-desktop
sudo service gdm restart (Or a reboot is easier)
```

Unity uses `lightdm` and Gnome uses `gdm` or `gdm3`, I prefer `gdm3`.

If you want the default login a certain one select either lightdm or gdm. If you want to change it later run:

```sh
sudo dpkg-reconfigure gdm
# or
sudo dpkg-reconfigure lightdm
```

***

[(Back to top)](#table-of-contents)

## Fix: Sound Indicator Not Showing
This appears in the top-right menu on Unity. Tested in 14/15.

This will also fix Tweak UI if a sound item is missing.
```sh
sudo apt-get install -y indicator-sound
```

For Unity (Default)
```sh
killall unity-panel-service
```

For Gnome
```sh
killall gnome-panel
```

## Improve: Easy Window Resize
Without Compiz, you can resize windows very nicely:
- Focus on a window
- Hold <kbd>ALT</kbd> + Middle Mouse Click + Drag
- Note: Depending on where you position your mouse to will resize up/down/left/right

## Improve: Left or Right Close Buttons
Run this simple command in the terminal and you will see the positions change right away.

Move to right (terminal)

    gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

Move to left (terminal)

    gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'


## Fix: Gnome Lockscreen
In terminal make sure this is false, then try your hotkey `ctrl+alt+l` or if you set it like min `super+l` in the settings:

    gsettings set org.gnome.desktop.lockdown disable-lock-screen 'false'

## Fix: Touchpad When Typing
A circulating bug is having two mousedrivers installed. To find out, for a Dell XPS they suggest you may have two mouse drives installed `xinput list` to find out.

On my X1 Carbon 3rd Generation, my problem was resolved with the following.

```sh
sudo vim /usr/share/X11/xorg.conf.d/51-synaptics-quirks.conf
```

> **IMPORTANT**: This will overwrite your speed settings from your GUI mouse settings. Remove items you need.

At the bottom of the file I appended the following:

```sh
Section "InputClass"
    Identifier "x1carbon touchpad catchall"
    MatchIsTouchpad "on"
    MatchDevicePath "/dev/input/event*"
    Driver "synaptics"

    # three fingers for the middle button
    Option "TapButton3" "2"
    Option "LockedDrags" "1"

    # Accurate tap-to-click
    Option "FingerLow" "50"
    Option "FingerHigh" "55"

    # Prevents too many intentional clicks
    Option "PalmDetect" "0"

    # "natural" vertical and horizontal scrolling
    Option "VertTwoFingerScroll" "1"
    Option "VertScrollDelta" "-75"
    Option "HorizTwoFingerScroll" "1"
    Option "HorizScrollDelta" "-75"
EndSection
```

Then reload lightdm or gdm/gdm3:
```sh
sudo service lightdm restart
# or
sudo service gdm restart
# or
sudo service gdm3 restart
```

## Fix: Gnome Freeze
This is a rare things for me, it happens much more in unity and requires a lot more "damaging" things. To fix a gnome that seems frozen do the following:

<kbd>ALT + F2</kbd> enter in <kbd>r</kbd> (lowecase) and press <kbd>Enter</kbd>

***
[(Back to top)](#table-of-contents)

## Improve: Adjust Mouse and Devices
When using a USB mouse sometimes the speed is just not right, in my case it's too slow often. Here is how to adjust it:

    xinput --list

I get something like this:

    ⎡ Virtual core pointer                      id=2    [master pointer  (3)]
    ⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
    ⎜   ↳ ETPS/2 Elantech Touchpad                  id=15   [slave  pointer  (2)]
    ⎜   ↳ Logitech Unifying Device. Wireless PID:101b   id=12   [slave  pointer  (2)]
    ⎣ Virtual core keyboard                     id=3    [master keyboard (2)]
        ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
        ↳ Power Button                              id=6    [slave  keyboard (3)]
        ↳ Video Bus                                 id=7    [slave  keyboard (3)]
        ↳ Power Button                              id=8    [slave  keyboard (3)]
    ...

The ID of my mouse is `12`.
You can see all the properties with:
```sh
xinput --list-props 12
```

Then you can adjust the settings the String value and a value at the end:
```sh
xinput --set-prop 12 "Device Accel Constant Deceleration" 2
```

## Preserve Settings

To keep the settings in Gnome, do the following:
```sh
cd ~
touch gnome-boot.sh && chmod +x gnome-boot.sh
```

Example of `gnome-boot.sh` file (Note: You can call it whatever you like):
```sh
#!/bin/bash
xinput --set-prop 12 "Device Accel Constant Deceleration" 4
```

Then Add the Bash script the Gnome Session:
```sh
gnome-session-properties
```

***
[(Back to top)](#table-of-contents)

# Virtual Machine

- My Host is **Windows**, and my Guests are **Linux**.
    - I don't use OSX since they lock-down and control too much :)
- These are focused on **VMWare workstation 11+* unless mentioned. Many settings may work in older version!
- You can edit your `*.vmx` files individually or you can configure a global settings:

## Global Configuratioh Locations

- How the Settings work:
    - **CONFIGURATION**: The Global settings in the GUI preferences.
    - **SETTINGS**: Applies to All Virtual Machines `*.vmx` files.

- **Windows**:
    - **SETTINGS**: (One or the other, I am using the 'Documents and Settings` for Windows 7, I have not tried Windows 10.
        - `C:\Documents and Settings\All Users\VMware\VMware Workstation\settings.ini` (Used on Win 7)
        `- C:\ProgramData\VMware\VMware Workstation\settings.ini`
    - CONFIGURATION:
        - `C:\ProgramData\VMware\VMware Workstation\config.ini` (Used on Win 7)
        - `C:\Users\<user>\AppData\Roaming\VMware\config.ini`
- **Linux**:
    - SETTINGS: `/home/vmware/.vmware/preferences `
    - CONFIGURATION: `/usr/lib/vmware/settings`

## Speed up Guest Machine
These are over the counter solutions, not hacks, see: [VMware Performance Enhancing](http://artykul8.com/2012/06/vmware-performance-enhancing/).

I added these settings below to the global `settings.ini`. Again, which is located at:

- Again, these settings will apply to **every** Guest Host unless you only edit the `*.vxm file`.
- Tips:
    - **Important**: Copy/Paste into a editor that will not breka the tabbing.
    - `Semicolins ;` are used for comments in `*.ini` files.

> **Warning**: Please leave file open while making changes. You can revert them easier.
```
.encoding = "windows-1252"  ; This is different based on your OS
printers.enabled = "True"   ; (Default) False

; -------------------------------------------------------
; Tweak: Disable memory swap files .vmem files
; -------------------------------------------------------
mainMem.useNamedFile = "FALSE"
; Unfortunately this parameter does not work for VMware Player, as it always creates virtual machine’s full memory swap file.
; For VMware Fusion on Mac and Linux instead of mainMem.useNamedFile you have to set mainMem.backing flag.
mainMem.backing = "swap"  ; (Disable on: Mac Fusion)

; -------------------------------------------------------
; Tweak: Choose the right disk controller and specify SSD
; -------------------------------------------------------
; Instead of the latest SATA AHCI controller choose LSI Logic SAS controller with SCSI disk for Windows guest OS, or PVSCSI for other types of OS. Unfortunately SATA AHCI on VMware has the lowest performance out of the three controllers and highest CPU overhead (see the references on the topic at the end). In addition to choosing the right controller, if your host disk is SSD you can explicitly specify the disk type as SSD to guest OS.
; scsi0:0.virtualSSD = 1

; -------------------------------------------------------
; Tweak: Disable log files for VM
; -------------------------------------------------------
; logging = "FALSE"
; Alternatively you can specify a different location to store the log file, if you ever need them:
; log.filename = "c:\Windows\Temp\vm1.log"

; -------------------------------------------------------
; Tweak: Other Disk & Memory I/O Performance Optimization
; -------------------------------------------------------
; Disable memory trimming:
MemTrimRate = "0"

; Disable page sharing:
sched.mem.pshare.enable = "FALSE"

; Disable scale down of memory allocation:
MemAllowAutoScaleDown = "FALSE"

; Memory allocation configuration:
prefvmx.useRecommendedLockedMemSize = "TRUE"
prefvmx.minVmMemPct = "100"  ; (optional) (Percentage of Allocated Memory to use)

; -------------------------------------------------------
; Tweak: Disabling Snapshots
; -------------------------------------------------------
; Unity might be a great feature for running virtual desktops operating systems, but it is not the most useful for virtualizing server OS. An annoying sign of enabled unity is GuestAppsCache or caches folder with a large number of files and subfolders. In order to disable it for your VM add the following lines:
; snapshot.disabled = "TRUE"

; -------------------------------------------------------
; Tweak: Disable Unity Mode
; -------------------------------------------------------
; If you do not want to share Guest to Host files.
isolation.tools.unity.disable = "TRUE"
unity.allowCompositingInGuest = "FALSE"
unity.enableLaunchMenu = "FALSE"
unity.showBadges = "FALSE"
unity.showBorders = "FALSE"
unity.wasCapable = "FALSE"

; -------------------------------------------------------
; Tweak: MacBook Retina Display Optimization (OSX Only)
; -------------------------------------------------------
; Disable automatic fitting to window:
; pref.autoFitGuestToWindow = "FALSE"

; Set a different resolution (or in user interface select VM – Settings – Display – uncheck ‘Use full resolution for Retina display’):
; gui.applyHostDisplayScalingToGuest = "FALSE"

; When in full-screen mode, there is a couple of options to control how guest is rendered:
; pref.autoFitFullScreen = "stretchGuestToHost" or pref.autoFitFullScreen = "fitHostToGuest"
```


## Fix Mouse Side Buttons in VMWare
Append the following to `yourbox.vmx` and restart your machine. You can also place this in the global settings.ini to apply
to every Guast Machine.

```
; -------------------------------------------------------
; Fix Mouse Left/Right Navigation
; -------------------------------------------------------
mouse.vusb.enable = "TRUE"
mouse.vusb.useBasicMouse = "FALSE"
usb.generic.allowHID = "TRUE"
```

## Fix Copy/Paste From Host and Guest
On Windows 10 the copy paste from Host to Guess and vice versa does not appear to work no matter what you do.
The only solution I have found that worked is this.

    - Right click your VirtualMachine
    - Select Settings
    - Go to the Options Tab
    - Go to Shared Folders
    - Set to Always Enabled
    - Reboot Guest

## Speed up Mouse Wheel
If your mouse just won't seem to cooperate no matter what you do a last option is to install this program:
```
sudo apt-get install -y imwheel
; Create an rc file
vim ~/.imwheelrc

; Paste the following (This is how many lines to skip at once)
".*"
  2 None,      Up,   Button4, 2
  3 None,      Down, Button5, 2
  4 Control_L, Up,   Control_L|Button4
  5 Control_L, Down, Control_L|Button5
  6 Shift_L,   Up,   Shift_L|Button4
  7 Shift_L,   Down, Shift_L|Button5

; Change Button4/Button5 (Back and Forward) to a new value and reload imwheel settings
imwheel --kill --buttons "4 5"

; Repeat as necessary until you find a comfortable value
```

## Vagrant VBGuest Fix:

    vagrant plugin install vagrant-vbguest

    vagrant ssh
    sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions


## Windows 8 VirtualBox Fix
Running Windows 8 in Virtualbox has an odd error, run this in `cmd` or `powershell`, or `terminal` on linux.

    vboxmanage list vms
    vboxmanage setextradata "The Box Name" VBoxInternal/CPUM/CMPXCHG16B 1

## Install ATI Drivers

    sudo apt-add-repository ppa:xorg-edgers/ppa
    sudo apt-get update

    sudo apt-get install -y fglrx
    sudo amdconfig --initial
    sudo apt-get install -y gksu

**To Edit Catalyst Settings**; Type the following in the Global Launcher *(Super Key/Windows Key)*:

    gksu amdcccle

## Remove ATI Drivers

    sudo apt-get remove --purge fglrx fglrx_* fglrx-amdcccle* fglrx-dev*
    sudo rm /etc/X11/xorg.conf
    sudo apt-get install --reinstall xserver-xorg-core libgl1-mesa-glx libgl1-mesa-dri libgl1-mesa-glx libgl1-mesa-dri
    sudo dpkg-reconfigure xserver-xorg

***

[(Back to top)](#table-of-contents)

# Chrome Addons

- [Chroma Color Picker](https://chrome.google.com/webstore/detail/chroma/gefgglgjdlddcpcapigheknbacbmmggp?utm_source=chrome-app-launcher-info-dialog)
- [Postman Rest Client](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?utm_source=chrome-app-launcher-info-dialog)

***

[(Back to top)](#table-of-contents)

# Other Applications
- [Chrome](https://www.google.com/intl/en-US/chrome/browser/)
- [Sublime Text 3](http://www.sublimetext.com/3)
- [Skype](http://www.skype.com/en/download-skype/skype-for-computer/)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
  - Preferred: [Debian-based Linux distributions](https://www.virtualbox.org/wiki/Linux_Downloads)
- [Vagrant](http://www.vagrantup.com/)
- [DragonDisk](http://www.dragondisk.com/) S3
- Kazam (Screen Recorder)
- Shutter
- Compiz Config
- gnome-system-tools
- Terminator
- Gdeb
- MySQL Workbench
- Synaptic Package Manager
- Bleachbit (Trash Cleaner)
- Preload (Intelligent Bootup Time)
- [DBeaver](http://dbeaver.jkiss.org/)
- Numix Theme & Numix Circle Icons
- PIP
    - fabric
    - virtualenv
    - virtualenvwrapper

# Fix

Fix Stuff when it goes bad.

## Bad Superblock to Busybox initramfs

You should see a terminal mentioning `BusyBox` and your Partion that is bad. To fix, first exit.

```
(initramfs) exit
```

You'll be taken to more console commands, now run fsck on the bad partition and it should fix it in about 20 seconds. Mine happened to be `/dev/sda1`.

```
fsck /dev/sda1  -y
```


***

By [JREAM](http://jream.com) 2014-2017

[(Back to top)](#table-of-contents)
