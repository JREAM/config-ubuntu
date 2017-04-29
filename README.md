# Config Ubuntu

This is for [Ubuntu](http://ubuntu.com/desktop) 16+ Desktop and/or Server.
Older versions are no longer supported.


Terminal Help Has been moved: [https://github.com/JREAM/ubuntu-cheatsheet](https://github.com/JREAM/ubuntu-cheatsheet)

## Install

Since there is a git submodule, you need to run the following:
```
git clone https://github.com/JREAM/config-ubuntu.git
cd config-ubuntu
git submodule init && git submodule update
```

Or in one line:
```
git clone https://github.com/JREAM/config-ubuntu.git && cd config-ubuntu && git submodule init && git submodule update
```

### Script Files
For user specific items such as dotfiles, it will install under the user running
the `sudo` command. So if i do `jesse@x1> sudo ./server.sh` and run `dot` all
the dotfiles will be set with my username. (This does not apply to global
packages.)

- **Run a main script file**:
- `sudo ./desktop.sh` Options to install desktop items.
- `sudo ./server.sh` Options to install server items, you can do this on your desktop also.
- `sudo ./devops.sh` Options to install devops items, you can do this on your desktop also.

* You must run from a main script otherwise paths and variables would be off. There is a built in check to prevent this also.

## Instant Install
Now you can run an instant install with the `instant-install.sh` file.

- Open `autoinstall.sh` in a text editor.
- Go down to the `autoinstall` array.
- Remove the `#` before any items you want to install, example:
    - `# /bin/dot.sh`
    - becomes:
    - `/bin/dot.sh`

Once this is set to your like, run the script:
```
sudo ./autoinstall.sh
> You will be prompted to confirm.
```

There are two protective measures:

- 1) If nothing is uncommented it will not run.
- 2) You will be prompted once with a list of packages you uncommented, you must confirm once before installing.

***

# Table of Contents
- [Order of Grub](#order-of-grub)
- [Dot Files](#dot-files)
- [Tweaking the UI](#tweaking-the-ui)
- [Utilities](#utilities)
    - [Convert PPK to SSH Key](#convert-ppk-to-ssh-key)
    - [RedShift For Eye Strain](#redshift-for-eye-strain)
    - [Numix Theme](#numix-theme)
    - [Wine](#wine)
    - [USB Maker for Windows ISO on Linux](#usb-maker-for-windows-on-linux)
- [LAMP](#lamp)
    - [PHP5](#php5)
    - [Apache](#apache)
    - [Nginx](#nginx)
    - [MySQL](#mysql)
    - [MyCLI](#mycli) Terminal MySQL Utility
    - [Redis](#redis)
    - [Phalcon](#phalcon)
    - [Phalcon Dev Tools](#phalcon-dev-tools)
    - [Secure Permissions](#secure-permissions)
- [Python](#python)
- [Ruby](#ruby)
- [NodeJS](#nodejs)
- [Java](#java)
- [Google Chrome](#google-chrome)
- [Ubuntu Fixes](#ubuntu-fixes)
    - [Sound Indicator Not Showing](#sound-indicator-not-showing)
- [Install Gnome 3](#install-gnome-3)
    - [Easy Window Resize](#easy-window-resize)
    - [Left or Right Close Buttons](#left-or-right-close-buttons)
    - [Fix Gnome Lockscreen](#fix-gnome-lockscreen)
    - [Fix Touchpad When Typing](#fix-touchpad-when-typing)
    - [My Gnome Extensions](#my-gnome-extensions)
    - [Reload Gnome Freeze](#reload-gnome-freeze)
- [Adjust Mouse and Devices](#adjust-mouse-and-devices)
- [Virtual Machine Related](#virtual-machine-workstation-related)
    -[Global Configuration Locations](#global-configuration-locations)
    - [Speed up Guest Machine](#speed-up-guest-machine)
    - [Fix Copy/Paste From Host and Guest](#fix-copy-paste-from-host-and-guest)
    - [Fix Mouse Side Buttons in VMWare](#fix-mouse-side-buttons-in-vmware)
    - [Speed up Mouse Wheel](#speed-up-mouse-wheel)
    - [Vagrant VBGuest Fix](#vagrant-vbguest-fix)
    - [Windows 8 VirtualBox Fix](#windows-8-virtualbox-fix)
    - [Install ATI Drivers](#install-ati-drivers)
    - [Remove ATI Drivers](#remove-ati-drivers)
- [Chrome Addons](#chrome-addons)
- [Other Applications](#other-applications)

***

[(Back to top)](#table-of-contents)

# Order of Grub
If you are running Grub as your default boot-loader, you can use this application to make it easier to change the order.

    sudo add-apt-repository ppa:danielrichter2007/grub-customizer
    sudo apt-get update && sudo apt-get install grub-customizer

Load the application either with `<Super>` and look for grub customizer or terminal `gksudo grub-customizer`.

Go to the `General Settings` tab, and you'll see *default entry*.

- Click the drop-down list and you can either select Entry By Order (Left Column) Or a specific Item (Right Column).
- If you are dual booting Windows and want Windows the default, Select the right column for Windows.
- The reason is if more items are added, perhaps new kernels, then if Position 5 which held Windows will no longer be the default.

***

[(Back to top)](#table-of-contents)

# Dot Files
Here are some shortcuts for the dotfiles if you use them:

| Shortcut | Action |
|----------|--------|
| mkproject &lt;name&gt; | virtualenv in ~/projects/&lt;name&gt; |
| workon &lt;name> | load virtualenv in ~/projects/&lt;name&gt; |
| l  | ls -la |
| la | ls -la |
| .. | cd .. |
| ... | cd ../../ |
| .... | cd ../../../ |
| ffile | find . name &lt;your_file&gt; (Searches for file in current folder) |
| ftext | ftext () { grep -rnwi &lt;your_text&gt; . ;} (Searches for text in file of current folder) |
| ip | current IP address |
| ports | see open ports |
| update | apt update |
| updatey | apt update && install -y |
| ngmake <name> | vim etc/nginx/sites-available/&lt;name&gt; |
| ngenable <name> | enable nginx &lt;name&gt; |
| ngdisable <name> | disable nginx &lt;name&gt; |
| h | history |
| codi python test.py | interactive scratch pad, See: [Codi](https://github.com/metakirby5/codi.vim)  |

| Git Alias | Command (See ~/.gitconfig) |
|----------|--------|
| git lg | git log --graph --pretty=format:'long-string' |
| git co | git checkout |
| git ci | git commit |
| git aa | git add --all |
| git st | git status |
| git di | git diff |
| git dc | git diff --cached |

# Tweaking the UI
This is for tweaking the UI

    sudo apt-get install -y\
        unity-tweak-tool\
        compizconfig-settings-manager\
        compiz-plugins\
        dconf-editor\
        synaptic

- The Tweak Tool works great for Applying the Numix theme
- Compiz is good for customizing everything, make sure to save a profile when you make your UI how you like.

# Utilities
These are some common items I enjoy using

    sudo apt-get install -y\
        vim\
        git\
        mercurial\
        meld\
        curl\
        htop\
        xclip\
        unzip\
        terminator\
        gdebi\
        preload\
        bleachbit\
        ubuntu-restricted-extras

## Convert PPK to SSH Key
Already included in the utils is `putty-tools`. To convert a `*.ppk` (Putty Key) to an SSH or EC2 valid key do the following.

```
puttygen your_key.ppk -O private-openssh -o id_dsa
puttygen your_key.ppk -O public-openssh -o id_dsa.pub
```

Then move it to your SSH folder with proper permissions:
```
mv -i ~/id_dsa* ~/.ssh
chmod 600 ~/.ssh/id_dsa
chmod 644 ~/.ssh/id_dsa.pub
```

## RedShift For Eye Strain

    sudo apt-get -y install redshift

Create your configuration file:

    sudo vim ~/.config/redshift.conf

Adjust the temperatures you prefer. I like mine to be very yellow and dim. (The lower the dimmer)

    [redshift]
    temp-day=3500
    temp-night=3500
    ; Set the screen brightness. Default is 1.0.
    ;brightness=0.9
    ; It is also possible to use different settings for day and night
    ;brightness-day=0.7
    ;brightness-night=0.4
    ; There are more settings for Gamma, Location Provider, Manual Location, etc.

Close and reload redshift. If you cannot find the icon anywhere run this in terminal:

    pkill redshift-gtk && pkill redshift

If RedShift gives you a `Geoclue2` error do this:

    sudo vim /etc/geoclue/geoclue.conf

Append these lines at the bottom:

    [redshift]
    allowed=true
    system=false
    users=

A newer version of redshift will install a desktop file so a Geoclue2 warning won't happen
on newer systems.

## Numix Theme

Use the **Unity Tweak Tool** to set these. *(Apply Icon & Themes)*

    sudo add-apt-repository ppa:numix/ppa
    sudo apt-get update
    sudo apt-get install -y numix-gtk-theme numix-icon-theme numix-icon-theme-circle

Turn it on using **Tweak UI**

## Wine
To run windows applications Wine is the best option. I often use HeidiSQL with Wine.

    sudo add-apt-repository ppa:ubuntu-wine/ppa
    sudo apt-get install -y wine1.7-amd64

If you need a 32bit installation:

    sudo apt-get install -y wine1.7-i386

## USB Maker for Windows ISO on Linux
You can easily use `Startup Disk Creator` and `UNetbootin` to create Linux to USB. But if you need Windows to USB from your Linux OS use Win USB:

    sudo add-apt-repository ppa:colingille/freshlight
    sudo sh -c "sed -i 's/trusty/saucy/g' /etc/apt/sources.list.d/colingille-freshlight-trusty.list"
    sudo apt-get update && sudo install -y winusb

We replace the sources.list back to saucy in order to get it to work for ubuntu 14, that is the purpose of the `sed` command.

***
[(Back to top)](#table-of-contents)

# LAMP
Linux Apache MySQL PHP

**- Installation for the following:**
- PHP 5.5+ (and Modules)
- Apache 2 (and Modules)
- Nginx *(Optional)*
- MySQL
- Redis
- and Header Files.

## PHP5
**PHP7 Ships with Ubuntu 16**

It's important to install **php5-dev** if you want to compile any add-ons later. We also want composer (PHP Package Manager) to be installed globally and accessible via `$ composer`

    sudo apt-get install -y php5 php5-dev php5-curl libpcre3-dev

    curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer

If you are looking for more PHP modules try:

    sudo apt-cache search php5-

## Apache

    sudo apt-get install -y apache2 libapache2-mod-php5

If you are looking for more Apache modules try:

    sudo apt-cache search libapache2-mod

## Nginx
Or if you prefer to use nginx

    sudo apt-get install -y nginx

## MySQL

    sudo apt-get install -y mysql-server mysql-client php5-mysql
    sudo sed -i 's/bind-address/bind-address = 0.0.0.0#/' /etc/mysql/my.cnf

The last line simply allows you to connect from outside of the machine. A good example of wanting that is if you had a Vagrant Box.

## MyCLI
This is a very nice utility in Python [https://github.com/dbcli/mycli](https://github.com/dbcli/mycli)

    pip install mycli

Usage (See the documents from the git link above for more example):

    mycli -h localhost -u root
    mycli -h localhost -u root -p

## Redis

    sudo apt-get install -y redis-server

## Phalcon

    sudo apt-add-repository ppa:phalcon/stable
    sudo apt-get update
    sudo apt-get install -y php5-phalcon

## Phalcon Dev Tools
This is an easy to use install script that will cleanup after itself. It can also be used for updating:

    sudo bash install_phalcon_devtools.sh

To test it run: `$ phalcon`

## Secure Permissions
We will use the Access Control Lists (ACL) or (Filesystem Access Control List). We will use group permissions for folders so you don't have to make the public writable, because `777` is dangerous.

    # Make sure you have ACL installed
    sudo apt-get install -y acl

Look for your main partition with:

    $ df


Mine happens to be `dev/root`, yours may be `dev/sda` or something. Make sure to replace that below:

    sudo /sbin/tune2fs -o +acl /dev/root

To see what file system you are using `ext3`, `ext4`, etc, use the partition:

    sudo file -sL /dev/root

We have to put the partition in read-only mode, then remount it:

    sudo /bin/mount -o remount /dev/root

Apply Group

    # This sets the Defaults
    setfacl -Rd g:www-data:rw /var/www
    # This sets future file
    setfacl -Rm g:www-data:rw /var/www

To Modify

    setfacl -Rm g:www-data:rw /var/www

Otherwise you could always set up a crontab such as:

    crontab -e

Then append this to run every five minutes.

    */5 * * * * /home/ramesh/backup.sh chgrp -R www-data /var/www && chmod g+rw /var/www

Lastly, you could have a deploy script that does this for you, such as Python `Fabfile`, but that's another topic.


***

[(Back to top)](#table-of-contents)

## Python

Python is installed by default on Ubuntu, version 2.7 is suitable. I strongly recommend installing `python-dev` for headers to compile certain PIP packages.

    sudo apt-get install -y python-dev
    sudo apt-get install -y python-pip
    sudo pip install fabric virtualenv virtualenvwrapper

If you plan on using SSL or PIL(Pillow) for Image manipulation,  I'd have these dependencies pre-installed:

    sudo apt-get install -y\
        libssl-dev\
        libffi-dev\
        libjpeg8-dev\
        libjpeg-dev

Note: Some programs use `libffi` (Foreign Functions Interface) and need the dev headers to build from it, as well as the other dev packages, yet FFI just looks funny to read.

***
[(Back to top)](#table-of-contents)

## Ruby
Install Ruby 2.X with header files in `ruby2.3-dev`, this will keep your gems from having issues.

    sudo apt-get install -y\
        ruby2.3\
        ruby2.3-dev\
        gems

For Ruby RVM (Version Management)

    gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable

***
[(Back to top)](#table-of-contents)

## NodeJS
I am using a PPA to fix the nodejs path issue(s)

    sudo apt-get install -y nodejs
    sudo chown -R $(whoami) ~/.npm

**Upgrade NodeJS**

Clear NPM's cache:

    sudo npm cache clean -f

Install a helper called `n`

    sudo npm install -g n

Install latest stable NodeJS version

    sudo n stable

Or pick a specific version:

    sudo n 0.8.20

***
[(Back to top)](#table-of-contents)

## Java
I use the default JRE/JDK, the others are up to you.

#### To insteall Default JRE/JDK

    sudo apt-get install -y\
        default-jre\
        default-jdk

#### To install OpenJDK (7, 8, or 9)

    sudo apt-get install -y\
        openjdk-8-jdk
        openjdk-8-jre

#### To install Oracle JDK (7, 8, or 9)

    sudo add-apt-repository ppa:webupd8team/java

    sudo apt-get install -y oracle-java7-installer
    sudo apt-get install y oracle-java8-installer
    sudo apt-get install y oracle-java9-installer

***
[(Back to top)](#table-of-contents)

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
***
[(Back to top)](#table-of-contents)

# Ubuntu Fixes
These are solutions to fix problems I've encountered.

### Sound Indicator Not Showing
This appears in the top-right menu on Unity. Tested in 14/15.

This will also fix Tweak UI if a sound item is missing.

    sudo apt-get install -y indicator-sound

For Unity (Default)

   killall unity-panel-service

For Gnome

    killall gnome-panel

# Install Gnome 3
If you prefer Gnome 3 over the Unity desktop it's easy to install:

    sudo apt-get install -y ubuntu-gnome-desktop
    sudo service gdm restart (Or a reboot is easier)

Unity uses `lightdm` and Gnome uses `gdm`, it's easiest to stick with lightdm.

If you want the default login a certain one select either lightdm or gdm. If you want to change it later run:

    sudo dpkg-reconfigure gdm

### Easy Window Resize
Without Compiz, you can resize windows very nicely:
- Focus on a window
- Hold <kbd>ALT</kbd> + Middle Mouse Click + Drag
- Note: Depending on where you position your mouse to will resize up/down/left/right

### Left or Right Close Buttons
Run this simple command in the terminal and you will see the positions change right away.

Move to right (terminal)

    gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

Move to left (terminal)

    gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'


### Fix Gnome Lockscreen
In terminal make sure this is false, then try your hotkey `ctrl+alt+l` or if you set it like min `super+l` in the settings:

    gsettings set org.gnome.desktop.lockdown disable-lock-screen 'false'

### Fix Touchpad When Typing
A circulating bug is having two mousedrivers installed. To find out, for a Dell XPS they suggest you may have two mouse drives installed `xinput list` to find out.

On my X1 Carbon 3rd Generation, my problem was resolved with the following.

```
sudo vim /usr/share/X11/xorg.conf.d/51-synaptics-quirks.conf
```

> **IMPORTANT**: This will overwrite your speed settings from your GUI mouse settings. Remove items you need.

At the bottom of the file I appended the following:

```
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

Then reload lightdm (or gdm if you are using it):
```
sudo service lightdm restart
```

### My Gnome Extensions
You need to use **Firefox** or **IceWeasle** at https://extensions.gnome.org/ to toggle these items. I suggest creating an account so you have a record.

You can use **TweakUI** (Tweak in Navigation) to toggle Extensions when they are installed.

- **Extensions I use**
- https://extensions.gnome.org/extension/770/force-quit/ Force Quit (Icon in Top Bar, must have)
- https://extensions.gnome.org/extension/750/openweather/ (Show your Weather, It's neat)
- https://extensions.gnome.org/extension/36/lock-keys/ (Turn off Numlock, Capslock and Notifications if you want.
- https://extensions.gnome.org/extension/701/top-panel-workspace-scroll/ (Mouse wheel or touchpad two fingers to move workspaces)
- https://extensions.gnome.org/extension/657/shelltile/ Hold CTRL for move/grouping windows much easier
- https://extensions.gnome.org/extension/878/alt-tab-list-first-window/ Alt+Tab lifts next window not starting at current. 
- https://extensions.gnome.org/extension/15/alternatetab/ Alt+Tab does not group by applications, more classic - I prefeer it
- Top Icons (Remove the bottom left slide out bar and put icons at top
    - https://extensions.gnome.org/extension/1031/topicons/
    - OR https://extensions.gnome.org/extension/1031/topicons/ 
- https://extensions.gnome.org/extension/427/workspaces-to-dock/ Sidebar Dock
- Favorites Dock (Like Cairo and Elementary)
    - https://extensions.gnome.org/extension/307/dash-to-dock/ Dash to Dock - More Features
    - https://extensions.gnome.org/extension/815/simple-dock/ Simple Dock
- https://extensions.gnome.org/extension/104/netspeed/ Display netspead in topbar (love this)
- [Toggle Touchpad](https://extensions.gnome.org/extension/935/toggle-touchpad/) (For Laptops)

- **Good Extensions**
- https://extensions.gnome.org/extension/906/sound-output-device-chooser/ Top menu drop drop for selecting Audio Devices

- **Other Extensions**
- [Applications Menu](https://extensions.gnome.org/extension/6/applications-menu/) - Display application menu top left bar instead of full screen menu window w/`Super`
- [Disable Workspace Switcher Popup](https://extensions.gnome.org/extension/959/disable-workspace-switcher-popup/) Dont show gray box when moving workspaces
- [Refresh Wifi Connections](https://extensions.gnome.org/extension/905/refresh-wifi-connections/) - Refresh Wifi Easily
- [Disconnect Wifi](https://extensions.gnome.org/extension/904/disconnect-wifi/) - Turn off Wifi

### Reload Gnome Freeze
This is a rare things for me, it happens much more in unity and requires a lot more "damaging" things. To fix a gnome that seems frozen do the following:

<kbd>ALT + F2</kbd> enter in <kbd>r</kbd> (lowecase) and press <kbd>Enter</kbd>


***
[(Back to top)](#table-of-contents)

# Adjust Mouse and Devices
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

    $ xinput --list-props 12

Then you can adjust the settings the String value and a value at the end:

    $ xinput --set-prop 12 "Device Accel Constant Deceleration" 2

## Preserve Settings

To keep the settings in Gnome, do the following:

    $ cd ~
    $ touch gnome-boot.sh && chmod +x gnome-boot.sh

Example of `gnome-boot.sh` file (Note: You can call it whatever you like):

    #!/bin/bash
    xinput --set-prop 12 "Device Accel Constant Deceleration" 4


Then Add the Bash script the Gnome Session:

    $ gnome-session-properties


***
[(Back to top)](#table-of-contents)

# Virtual Machine Workstation Related
- My Host is Windows, and my Guests are Linux.
    - I don't use OSX since they lock-down and control too much :)
- These are focused on *VMWare workstation 11+* unless mentioned. Many settings may work in older version!
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
- **OSX**
    - Note: Do not APPLY VMWare Fusion items here
    - /Applications/VMware Fusion.app/Contents/Library/settings

# Speed up Guest Machine
These are over the counter solutions, not hacks, see: [VMware Performance Enhancing](http://artykul8.com/2012/06/vmware-performance-enhancing/).

I added these settings below to the global `settings.ini`. Again, which is located at:

- Again, these settings will apply to **every** Guest Host unless you only edit the `*.vxm file`.
- Tips:
    - **Important**: Copy/Paste into a editor that will not breka the tabbing.
    - `Semicolins ;` are used for comments in `*.ini` files.

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

***

By [JREAM](http://jream.com) 2014-2017

[(Back to top)](#table-of-contents)
