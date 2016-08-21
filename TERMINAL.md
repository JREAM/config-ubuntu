# Terminal
This is an assortment of quick references to speed up your Terminal skills!
- [Basics](#basics)
- [Listing and Navigating](#listing-and-navigating)
- [Users](#users)
- [Groups](#groups)
- [Permissions](#permissions)
    - [Easy Permissions](#easy-permissions)
    - [Octal Permissions](#octal-permissions)
    - [Octal Examples](#octal-examples)
- [OS Details](#os-details)
    - [Operating System](#operating-system)g
    - [CPU Info](#cpu-info)
    - [Usage Info](#usage-info)
    - [Disk Space](#disk-space)
    - [System Processes](#system-processes)
    - [GUI Processes](#gui-processes)
- [List all Keybindings](#list-all-keybindings)
    - [See Keypressed](#see-keypressed)
- [OS Shutdown](#os-shutdown)
- [Crontab](#crontab)
- [Services](#services)
- [System State](#system-state)
- [Processes](#processes)
- [Bash](#bash)
    - [Bash Paths](#bash-paths)
    - [Add to Path](#add-to-path) 
    - [Bash Completions](#bash-completions)
    - [Fix Broken Bash Completions](#fix-broken-bash-completions)
    - [Log Script from Bash](#log-script-from-bash)
- [Finding Files](#finding-files)
- [Find in Files (GREP)](#find-in-files-grep)
    - [Pipe Grep](#pipe-grep)
- [Reading Files](#reading-files)
- [Downloading Files](#downloading-files)
    - [Using Wget](#using-wget)
    - [Using cURL](#using-curl)
- [Compressing and Uncompressing Files](#compressing-and-uncompressing-files)
    - [Compressing Files](#compressing-files)
    - [Decompressing Files](#decompressing-files)
- [SCP](#scp)
    - [Download from server to local](#download-from-server-to-local)
    - [Upload from local to server](#upload-from-local-to-server)
- [SSH](#ssh)
    - [Connecting to a server](#connecting-to-a-server)
    - [SSH Permissions](#ssh-permissions)
    - [Using the Config](#using-the-config)
- [Firewall](#firewall)
    - [UFW Status](#ufw-status)
    - [UFW Enable/Disable](#ufw-enabledisable)
    - [UFW Example Customization](#ufw-example-customization)
    - [UFW More Options](#ufw-more-options)
    - [UFW Deleting Rules](#ufw-deleting-rules)
    - [UFW Reset Rules](#ufw-reset-rules)
- [MySQL](#mysql)
    - [Connecting](#connecting)
    - [Exporting Database to SQL](#exporting-database-to-sql)
    - [Importing SQL Files](#importing-sql-files)
    - [Exporting Compressed Database](#exporting-compressed-database)
    - [Importing Compressed Database](#importing-compressed-database)
- [Git](#git)
    - [Populate a Repository](#populate-a-repository)
    - [Add or Remove Files](#add-or-remove-files)
    - [Ignoring files](#ignoring-files)
    - [Create a Branch](#create-a-branch)
    - [Switch Branches](#switch-branches)
    - [Create a Tag](#create-a-tag)
    - [Remove a Tag](#remove-a-tag)
    - [Clone a Respository](#clone-a-repository)
    - [Current Status](#current-status)
    - [Commit Log and Show](#commit-log-and-show)
    - [Reset Hard](#reset-hard)
    - [Prune](#prune)

## Basics
***
[(Back to Top)](#terminal)
```
whereis bash (find absolute location of bash, or any file)
whatis ls (tells you about the command)
man ls (manual to give you a list of all command arguments for any command)
locate crontab (I like mlocate more)
which python
```

# Listing and Navigating
***
[(Back to Top)](#terminal)
```
ls              (list files)
ls -la          (list all files, permissions, and hidden too)
pwd             (print working directory)
cd ..           (go down a directory)
cd /            (go to lowest level)
cd ~            (go to logged in user's home)
cd /var/www     (go to absolute path)
```


# Users
***
[(Back to Top)](#terminal)

```
su - username       (switch users)
sudo su             (switch to root)

passwd              (change logged in users password)
passwd username     (change another users password)

useradd -m -s /bin/bash username
usermod -a -G existing_group existing_user
```

# Groups
***
[(Back to Top)](#terminal)
Do not delete groups you don't know what they are used for, that's dangerous!
```
groups                  (see what groups current user belongs to)
groupadd name           (create a group)
groupadd -g 900 name    (create a group with custom GroupID aka gid)

groupdel name           (delete a group)
sudo useradd <group>    (add current user to a group)

cat /etc/group          (list all groups)
cut -d: -f1 /etc/group  (list all groups, cleaner)
```

# Permissions
***
[(Back to Top)](#terminal)

There are two ways to manage permissions, one is by text the other is by an octal value.

### Easy Permissions
```
; Change Mode
; Options: (O)wner (U)sers (G)roup or (A)ll
; File:    Owner: rwx, Group: rwx, User: rwx

chmod g+rw file
chmod og+rw file.txt

; Change Ownership
chown user:group files_or_folder
chgrp group files_or_folder

; Recursively:
chown -R user:group files_or_folder
chgrp -R group files_or_folder
chmod -R og+rw files_or_folder
```

### Octal Permissions
You may have seen this a lot, you can use octal or decimal (begins with a 0) to do the same thing.
```
Permissions:
0 = None
1 = Execute (e)
2 = Write (w)
4 = Read (r)
```

- There are 3 Permission types (Read, Write, Execute), or 4 if you count "None".
- There are 3 Sets: Owner/User/Group (In that order)
- So if you did `chmod 700 file.txt` it would allow the user to Read, Write and Execute
  - Because `7` is the total of `4 + 2 + 1`

### Octal Examples
```
chmod 600 file.txt – Owner Read, Write
chmod 660 file.txt – Owner Read, Write; User Read, Write
chmod 770 file.txt – Owner Read, Write, Execute
chmod 770 file.txt – Owner Read, Write, Execute; User Read, Write, Execute
chmod 666 file.txt – All Read, Write
chmod 777 file.txt – All Read, Write, Execute
```

# OS Details
***
[(Back to Top)](#terminal)

Get fundamental information about your OS with the following commands, you may have to run them as `sudo`, eg: `sudo lsb_release -a`.

##  Operating System

    lsb_release -a
    lsb_release -as     # Short Information
    lsb_release --help

### CPU Info

    nproc               # How many Processing Units
    cpuid               # Must install cpuid from terminal
    cat /proc/cpuinfo   # Lots of info

### Usage Info

    free -h             # Human readable, or do --help for options
    vmstat -s
    cat /proc/meminfo   # Lots of info

### Disk Space

    df
    df -B MB    # In Megabtyes,  etc

### System Processes

    top
    htop  # If you installed it

### GUI Processes

    gnome-system-monitor

# List all Keybindings
***
[(Back to Top)](#terminal)

    gsettings list-recursively  org.gnome.desktop.wm.keybindings | sort | more

### See Keypressed
[(Back to Top)](#terminal)

    xev

    # Or for a lot of details:

    xev | grep KeyPress


# OS Shutdown
***
[(Back to Top)](#terminal)
```
shutdown
reboot
shutdown -h now
shutdown -h +10     (shutdown 10 mins)
shutdown -r now     (reboot now)
```

# Crontab
***
[(Back to Top)](#terminal)
```
crontab -e              (edit crontab for current user)
crontab -l              (list crontab for other user)
crontab -u jesse -l     (see crontabs for specific user)
```

# Services
***
[(Back to Top)](#terminal)
```
service ssh status      (service status)
service --status-all    (all services status)
```

# System State
***
[(Back to Top)](#terminal)
```
uname -a (get linux info)

top (See running processes/system status, I suggest installing `htop`)
top -u www-data
htop -u www-data

df          (display disk space in bytes, default)
df -h       (display disk space human readable)
df -Th      (display disk space with partitions)

free (see memory used)
free -g (in gigabytes)
```

# Processes
***
[(Back to Top)](#terminal)
```
ps -ef | more       (current running processes)
ps -efH | more      (current running processes in a tree)

ps -ef | grep vim   (find vim process id)
kill -9 <id>        (no brackets)
```

# Bash
***
[(Back to Top)](#terminal)

Bash is my shell of choice, which is why I have a `.bashrc` file.

### Bash Paths

Executables and commands are automatically in the path, see your path with:
```
echo $PATH
```

### Add to Path 

```
# I suggest editing your ~/.profile

vim ~/.profile
if [ -d "/path/to/your/bin" ] ; then
  PATH="$PATH:/path/to/your/bin"
fi
```

*Note: Order of Linux Reading files: ~/.bash_profile, ~/.bash_login, and ~/.profile, so don't try to use a ~/.profile variable within ~/.bash_profile*

### Bash Completions

The locations for bash completio0ns can be found at:
```
cd /usr/share/bash-completion/completions.d/
cd /etc/bash_completions.d/
```

### Fix Broken Bash Completions

```
sudo apt-get install --reinstall bash-completion
```

### Log Script from Bash
At the top of your file, find the executable you are using one of these, eg:
```
which bash     # /usr/bin/bash
which python   # /usr/bin/python
which php      # /usr/bin/php
```

At the top of your [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) for the executable file add:
```
#!/bin/bash
#!/usr/bin/php
#!/usr/bin/python
```

make sure to `+x` it:
```
chmod +x app.sh
chmod +x app.php
chmod +x app.py
```

You can then run the script via Bash:
```
/scripts/app.sh >> /scripts/output.log 2>&1
/scripts/app.php >> /scripts/output.log 2>&1
/scripts/app.py >> /scripts/output.log 2>&1
```

You could even crontab it the same way:
```
*/10 * * * * app.php >> /output.log 2>&1
*/10 * * * * app.py >> /output.log 2>&1
```

# Finding Files
***
[(Back to Top)](#terminal)

Generally the following arguments are as follows:
- `-type f` file
- `-type d` directory
- `-iname` case insensistive (book.txt would the same as BOOK.TXT)
- `*` is a wildcard to find anything, usually you put it at the start or end of a filename.
```
find . -name tecmint.txt
find /home -name tecmint.txt
find /home -iname tecmint.txt                        (case ignore)
find / -type d -name Tecmint                         (directory)
find . -type f -perm 0777 -print (with perms)
find / -type f ! -perm 777 (find without)
find . -type f -name "tecmint.txt" -exec rm -f {} \; (find and remove a file)
find . -type f -name "*.txt" -exec rm -f {} \;       (find and remove multiple)
find /tmp -type f -empty                             (Find empty files)
find /tmp -type d -empty                             (find empty directories)
find / -size +50M -size -100M (findby swize)
```

# Find in Files (GREP)
***
[(Back to Top)](#terminal)

GREP means: Global Regular Expression Pattern (or Parser)

Some common GREP flags:
- `-r` is Recursive
- `-n` is Line Number
- `-w` Match the whole word
- `-l` is lowercase only
- `-c` supresses normal output and counts number of matching lines

```
grep -rn /path - "pattern_or_string"

; Output results to File
grep -rnw /path - "pattern_or_string" > output.txt
```

Look only in certain filetypes
```
; notice I used a regex ^ starts with, you can use a string or regex
grep --include=*.sh '^mysql' ./ 
```

More Examples:
```
grep "hello" file.txt (if in file)
grep "hello" files*  (if in many files)
grep -i "hello"  file.txt  (case insesitive)
grep -iw "is" file.txt (get full words, case insensitive)
grep "regex" file.txt
```

### Pipe Grep
```
php -i | grep ini
```

# Reading Files
***
[(Back to Top)](#terminal)

Without having to open a file you can simply read a part of it without `nano`, `pico, `vi`, or `vim`:
```
cat file.txt            (view file contents)
tail file.txt           (view end of file contents)
tail -n20 file.txt      (view top 20 lines)
tail -f filetxt         (follow a filename keep updating)
head file.txt           (view top of file contents)
head -n20 file.txt      (view top 20 lines)
```

# Downloading Files
***
[(Back to Top)](#terminal)

### Using Wget
```
wget http://file.com/something.txt                (Download a file locally)
wget -O newname.txt http://file.com/something.txt (Download file locally w/new name)
```

You can also use `SCP`, yet the above are easier for non-SSH connections.

### Using cURL
```
curl -O http://file.com/something.txt               (Download a file locally)
curl -o newname.txt http://file.com/something.txt   (Download file locally w/new name)
curl -O http://url_1 -O http://url_2                (Download multiple files)
```

# Compressing and Uncompressing Files
***
[(Back to Top)](#terminal)

To Compress a file you can use a variety of tools. You can type `man gzip` to see the full manual and line of commands, and use `esc` + `:x` and `ENTER` to exit from the Manual (It usually uses the Vi editor).

Most often in the Linux word you use and create `*.tar.gz` files, it has the most options. Whatever you prefer is up to you.

What the flags often stand for:
- `-c` is create
- `-f` is file
- `-k` is for Keep
    - `gzip` & `bzip2` will remove the original file once compressed
    -  Or they will remove the `.gz` when decompressing is done
- `-r` is recursive (for gzip and zip)
- `-v` is verbose (show details of what's happening)
- `-z` is for tar to gzip as well

###  Compressing Files
Note: You can compress more than one file at a time eg: `bzip2 file1.txt file2.txt file3.txt`
```
gzip -vk file.txt                   (Creates file.txt.gz)
bzip2 file.txt                      (Creates  file.txt.bz2)
tar -cvf file.tar file.txt          (Creates tar)
tar -czvf file.tar.gz file.txt      (Creates tar.gz)
zip filename.zip file.txt           (Creates filename.zip)
zip -r folder.zip path/to/folder    (Creates  folder.txt.bz2)
```

### Decompressing Files
To Uncompress we use similar commands for most of them
```
gunzip -dvk file.txt.gz
gzip -dvk file.txt.gz       (Same as above)
bzip2 -d file.txt.bz2
tar -xvf file.tar
tar -zxvf file.tar.gz
unzip test.zip
```

# SCP
***
[(Back to Top)](#terminal)

### Download from server to local
```
scp root@server.com:/path/to/file.txt file.txt
```

### Upload from local to server
```
scp file.txt root@server.com:/path/to/file.txt
```

# SSH
***
[(Back to Top)](#terminal)

### Connecting to a server
```
ssh name@server.com  (default port is 22)
ssh name@server.com -p 8000 (connect to specific port)
ssh name@server.com -i ~/.ssh/rsa_key.pub (connect with ssh key)
```

### .SSH Permissions

These are safe permissions to use for SSH
```
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa

# Put your pubkeys (one per line) for SSH login
chmod 600 ~/.ssh/authorized_keys 
```


### Using the Config
You can also create a `~/.ssh/config` file and store entries such as:
```
Host aws
Hostname ec2-50-50-130-50.compute-1.amazonaws.com
Port 22
Identityfile ~/.ssh/id_rsa
User myusername

Host my-vps
Hostname 50.50.130.50
Port 22
User root
```

You can then simply type:
```
ssh aws
ssh my-vps
```

# Firewall
***
[(Back to Top)](#terminal)

A firewall prevents unauthorized access to your machine, you should use `UFW` (Uncomplicated Firewall). You must always run this with `sudo`. If you don't have UFW installed, run:

```
sudo apt-get install ufw
```

### UFW Status
To see the Firewall Status run one of these:
```
sudo ufw status
sudo ufw status verbose
```

### UFW Enable/Disable
```
sudo ufw enable
sudo ufw disable
```

### UFW Example Customization
Please do not do this unless you know what you are doing.

You could start out with blocking all incoming connections.
```
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Then we allow only what we want
```
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow ftp
```

These are the same as:
```
sudo ufw allow 22   # same as ssh
sudo ufw allow 80   # same as http
sudo ufw allow 443  # same as https
```

### UFW More Options

If SSH was on port `3333` rather than the default `22` you would do:
```
sudo ufw allow 3333/tcp
```

Some more options:

```
sudo ufw allow 25 # SMTP
sudo ufw allow 110 # POP3
sudo ufw allow 995 # POP3S
sudo ufw allow 143 # IMAP
sudo ufw allow 993 # IMAPS
sudo ufw allow 3306 # MySQL
sudo ufw allow 5432 # Postgres
sudo ufw allow from 192.168.255.255 # Custom IP Address
```

### UFW Deleting Rules
Easily delete named rules
```
sudo ufw delete allow ssh
```

Delete rules that are numbered
```
sudo ufw status numbered
sudo ufw delete [number]
```

### UFW Reset Rules
```
sudo ufw reset
```

# MySQL
***
[(Back to Top)](#terminal)

### Connecting
```
mysql -u root -p (username, password prompt)
mysql -u root -p -h localhost (username, password prompt, host)
```

### Exporting Database to SQL
You can dump a single database easily:
```
mysqldump -u root -p DATABASE_NAME > file.sql
```

Or Dump all databases on your MySQL server with the `--all-databases` flag:
```
mysqldump -u root -p --all-databases > file.sql
```

### Importing SQL Files
You can do this through the shell only, or MySQL, first is the shell:
```
mysql -u root DATABASE_NAME < path/to/file.sql
```

To continue when there are MySQL Errors use -f or --force below:
```
mysql -u root DATABASE_NAME < path/to/file.sql --force
```

To use a password, just pass in the -p flag and type it in after running:
```
mysql -u root -p DATABASE_NAME < path/to/file.sql --force
```

Second, you can do it through MySQL once you connect:
```
mysql> use DATABASE_NAME;
mysql> source path/to/file.sql;
```

### Exporting Compressed Database
This will save a lot of space in this one liner:
```
mysqldump -u root -p DATABASE_NAME | tar -cvzf > output.sql.tar.gz
mysqldump -u root -p DATABASE_NAME | gzip -v > output.sql.gz
```

### Importing Compressed Database
Here is how you can import with the one liner:
```
mysql -u root -p DATABASE_NAME | tar -xzOf output.sql.tar.gz
mysql -u root -p DATABASE_NAME | gunzip < output.sql.gz
```

# Git
***
[(Back to Top)](#terminal)

### Populate a Repository
You have to first create a repostory, through BitBucket, GitHub, GitLab, etc.
```
git init
touch README.md
git remote add origin git@github.com/username/yourrepo.git
git add .
git commit -m "Starting with one file"
git push origin master
```
### Add or Remove Files
```
git add file.txt
git rm file.txt
```

### Ignoring files
Create a `.gitignore` file, and place something like this in it:
```
.tmp
.pyc
.cache
.DS_Store
```

### Create a Branch
Branches are used like when you don't want to ruin a main branch with working code.

```
git checkout -b develop
git push origin develop
```

### Switch Branches
```
git checkout master
git checkout develop
```

### Create a Tag
Tags create a snapshots of current code, you may name it as a version such as `1.0.1` and it produces a `tar.gz` and `zip` format for downloads.
```
git tag -a 1.0
git tag -a 1.0 -m "Optional Message"
git push --tags
```

### Remove a Tag
This will remove a tag from the Git host.
```
git tag -d 1.0
git push origin :refs/tags/1.0
```

### Clone a Respository
```
git clone git@github.com/username:your_repo.git
```

Clone into current directory
```
git clone git@github.com/username:your_repo.git .
```
### Current Status
```
git status
```

### Commit Log and Show
To see log data and more details use the short or long commit ID.
```
git log
git show eb7c86a5fbdc6c64df608f4c143c2718a100983b
```

### Reset Hard
This will reset your repository to the last revision and undo everything, use with caution.
```
git reset --hard HEAD
```

### Prune
Removes cached items no longer read by git
```
git prune
```
