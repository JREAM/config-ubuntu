# Terminal

This will help you with terminal commands

# Table of Contents
- [Basics](#basics)
- [Listing and Navigating](#listing-and-navigating)
- [Users](#users)
- [Permissions](#permissions)
- [OS Details](#os-details)
    - [Operating System](#operating-system)
    - [CPU Info](#cpu-info)
    - [Memory and Usage Info](#memory-and-usage-info)
    - [Disk Space](#disk-space)
    - [GUI Processes](#gui-processes)
- [List all Keybindings](#list-all-keybindings)
    - [See Keypressed](#see-keypressed)
- [OS Shutdown](#os-shutdown)
- [Crontab](#crontab)
- [Services](#services)
- [System State](#system-state)
- [Processes](#processes)
- [Reading Files](#reading-files)
- [Compressing and Uncompressing Files](#compressing-and-uncompressing-files)
    - [Compressing Files](#compressing-files)
    - [Decompressing Files](#decompressing-files)
- [Download Files](#download-files)
    - [Using Wget](#using-wget)
    - [Using cURL](#using-curl)
- [Find](#find)
- [Grep (Find in Files)](#grep-find-in-files)
    - [Pipe Grep](#pipe-grep)
- [SCP](#scp)
    - [Download from server to local](#download-from-server-to-local)
    - [Upload from local to server](#upload-from-local-to-server)
- [SSH](#ssh)
    - [Connecting to a server](#connecting-to-a-server)
    - [Using the Config](#using-the-config)
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

---

## Basics
```
whereis bash (find absolute location of bash, or any file)
whatis ls (tells you about the command)
man ls (manual to give you a list of all command arguments for any command)
locate crontab (I like mlocate more)
which python
```

## Listing and Navigating
```
ls              (list files)
ls -la          (list all files, permissions, and hidden too)
pwd             (print working directory)
cd ..           (go down a directory)
cd /            (go to lowest level)
cd ~            (go to logged in user's home)
cd /var/www     (go to absolute path)
```


## Users
```
su - username       (switch users)
sudo su             (switch to root)

passwd              (change logged in users password)
passwd username     (change another users password)

useradd -m -s /bin/bash username
usermod -a -G existing_group existing_user
```

## Permissions
```
; Change Mode
; Options: (O)wner (G)roup (U)sers or (A)ll
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

# OS Details

## Operating System

    lsb_release -a
    lsb_release -as     # Short Information
    lsb_release --help

## CPU Info

    nproc               # How many Processing Units
    cpuid               # Must install cpuid from terminal
    cat /proc/cpuinfo   # Lots of info

## Memory and Usage Info

    free -h             # Human readable, or do --help for options
    top or htop         # Must install htop
    vmstat -s
    cat /proc/meminfo   # Lots of info

## Disk Space

    df
    df -B MB    # In Megabtyes,  etc

## GUI Processes

    gnome-system-monitor

# List all Keybindings

    gsettings list-recursively  org.gnome.desktop.wm.keybindings | sort | more

## See Keypressed

    xev

    # Or for a lot of details:

    xev | grep KeyPress


## OS Shutdown
```
shutdown
reboot
shutdown -h now
shutdown -h +10     (shutdown 10 mins)
shutdown -r now     (reboot now)
```

## Crontab
```
crontab -e              (edit crontab for current user)
crontab -l              (list crontab for other user)
crontab -u jesse -l     (see crontabs for specific user)
```

## Services
```
service ssh status      (service status)
service --status-all    (all services status)
```

## System State
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

## Processes
```
ps -ef | more       (current running processes)
ps -efH | more      (current running processes in a tree)

ps -ef | grep vim   (find vim process id)
kill -9 <id>        (no brackets)
```

## Reading Files
Without having to open a file you can simply read a part of it without `nano`, `pico, `vi`, or `vim`:
```
cat file.txt            (view file contents)
tail file.txt           (view end of file contents)
tail -n20 file.txt      (view top 20 lines)
tail -f filetxt         (follow a filename keep updating)
head file.txt           (view top of file contents)
head -n20 file.txt      (view top 20 lines)
```

## Compressing and Uncompressing Files
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

#### Compressing Files
Note: You can compress more than one file at a time eg: `bzip2 file1.txt file2.txt file3.txt`
```
gzip -vk file.txt                   (Creates file.txt.gz)
bzip2 file.txt                      (Creates  file.txt.bz2)
tar -cvf file.tar file.txt          (Creates tar)
tar -czvf file.tar.gz file.txt      (Creates tar.gz)
zip filename.zip file.txt           (Creates filename.zip)
zip -r folder.zip path/to/folder    (Creates  folder.txt.bz2)
```

#### Decompressing Files
To Uncompress we use similar commands for most of them
```
gunzip -dvk file.txt.gz
gzip -dvk file.txt.gz       (Same as above)
bzip2 -d file.txt.bz2
tar -xvf file.tar
tar -zxvf file.tar.gz
unzip test.zip
```

## Download Files

#### Using Wget
```
wget http://file.com/something.txt                (Download a file locally)
wget -O newname.txt http://file.com/something.txt (Download file locally w/new name)
```

#### Using cURL
```
curl -O http://file.com/something.txt               (Download a file locally)
curl -o newname.txt http://file.com/something.txt   (Download file locally w/new name)
curl -O http://url_1 -O http://url_2                (Download multiple files)
```

## Find
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

## Grep (Find in Files)
GREP means: Global Regular Expression Pattern (or Parser)

Some common GREP flags:
- `-r` is Recursive
- `-n` is Line Number
- `-w` Match the whole word
- `-l` is lowercase only
- `-c` supresses normal output and counts number of matching lines

```
grep -rnw /path - "pattern_or_string"

; Output results to File
grep -rnw /path - "pattern_or_string" > output.txt
```

More Examples:
```
grep "hello" file.txt (if in file)
grep "hello" files*  (if in many files)
grep -i "hello"  file.txt  (case insesitive)
grep -iw "is" file.txt (get full words, case insensitive)
grep "regex" file.txt
```

#### Pipe Grep
```
php -i | grep ini
```

## SCP

#### Download from server to local
```
scp root@server.com:/path/to/file.txt file.txt
```

#### Upload from local to server
```
scp file.txt root@server.com:/path/to/file.txt
```

## SSH

#### Connecting to a server
```
ssh name@server.com  (default port is 22)
ssh name@server.com -p 8000 (connect to specific port)
ssh name@server.com -i ~/.ssh/rsa_key.pub (connect with ssh key)
```

#### Using the Config
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

## MySQL

#### Connecting
```
mysql -u root -p (username, password prompt)
mysql -u root -p -h localhost (username, password prompt, host)
```

#### Exporting Database to SQL
You can dump a single database easily:
```
mysqldump -u root -p DATABASE_NAME > file.sql
```

Or Dump all databases on your MySQL server with the `--all-databases` flag:
```
mysqldump -u root -p --all-databases > file.sql
```

#### Importing SQL Files
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

#### Exporting Compressed Database
This will save a lot of space in this one liner:
```
mysqldump -u root -p DATABASE_NAME | tar -cvzf > output.sql.tar.gz
mysqldump -u root -p DATABASE_NAME | gzip -v > output.sql.gz
```

#### Importing Compressed Database
Here is how you can import with the one liner:
```
mysql -u root -p DATABASE_NAME | tar -xzOf output.sql.tar.gz
mysql -u root -p DATABASE_NAME | gunzip < output.sql.gz
```


## Git

#### Populate a Repository
You have to first create a repostory, through BitBucket, GitHub, GitLab, etc.
```
git init
touch README.md
git remote add origin git@github.com/username/yourrepo.git
git add .
git commit -m "Starting with one file"
git push origin master
```
#### Add or Remove Files
```
git add file.txt
git rm file.txt
```

#### Ignoring files
Create a `.gitignore` file, and place something like this in it:
```
.tmp
.pyc
.cache
.DS_Store
```

#### Create a Branch
Branches are used like when you don't want to ruin a main branch with working code.

```
git checkout -b develop
git push origin develop
```

#### Switch Branches
```
git checkout master
git checkout develop
```

#### Create a Tag
Tags are final version numbers or stopping points that will be available as ZIP/TAR GZ files.
```
git tag -a 1.0
git tag -a 1.0 -m "Optional Message"
git push --tags
```

#### Remove a Tag
```
git tag -d 1.0
git push origin :refs/tags/1.0
```

#### Clone a Respository
```
git clone git@github.com/username:your_repo.git
```

#### Current Status
```
git status
```

#### Commit Log and Show
To see log data and more details use the short or long commit ID.
```
git log
git show eb7c86a5fbdc6c64df608f4c143c2718a100983b
```

#### Reset Hard
```
git reset --hard HEAD
```

#### Prune
Removes cached items no longer read by git
```
git prune
```
