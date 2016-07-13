# Terminal

This will help you with terminal commands

# Table of Contents
- [Basics](#basics)
- [Listing and Navigating](#listing-and-navigating)
- [Users](#users)
- [Permissions](#permissions)
- [Zipping](#zipping)
- [OS Shutdown](#os-shutdown)
- [Crontab](#crontab)
- [Services](#services)
- [System State](#system-state)
- [Processes](#processes)
- [MySQL](#mysql)
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
ls (list files)
ls -la (list all files, permissions, and hidden too)
pwd (print working directory)
cd .. (go dir down)
cd / (go to lowest level)
cd ~ (go to user home)
cd /var/www (go to specific path)
```


## Users
```
su - username (switch users)
sudo su (switch to root)

passwd (change your pass)
passwd username (change another users pass)

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

## Zipping
```
gzip test.txt  (compress)
gzip -d test.txt.gz (uncompress)
bzip test.txt (compress)
bzip -d test.txt.bz2 (uncompress)
unzip test.zip
unzip -i test.zip (see files without unzipping)
```

## OS Shutdown
```
shutdown
reboot
shutdown -h now
shutdown -h +10 (shutdown 10 mins)
shutdown -r now (reboot now)
```

## Crontab
```
crontab -e (edit crontab for current user)
crontab -l (list crontab for other user)
crontab -u jesse -l (see crontabs for specific user)
```

## Services
```
service ssh status (service status)
service --status-all (all services status)
```

## System State
```
uname -a (get linux info)

top (See running processes/system status, I suggest installing `htop`)
top -u www-data
htop -u www-data

df (display disk space in bytes, default)
df -h (display disk space human readable)
df -Th (display disk space with partitions)

free (see memory used)
free -g (in gigabytes)
```

## Processes
```
ps -ef | more (current running processes)
ps -efH | more  (current running processes in a tree)

ps -ef | grep vim (find vim process id)
kill -9 <id> (no brackets)
```

## Reading Files
```
cat file.txt (view file contents)
tail file.txt (view end of file contents)
tail -n20 file.txt (view top 20 lines)
tail -f filetxt (follow a filename keep updating)
head file.txt (view top of file contents)
head -n20 file.txt (view top 20 lines)
```

## MySQL
```
mysql -u root -p (username, password prompt)
mysql -u root -p -h localhost (username, password prompt, host)
```

## Download Files

#### Using Wget
```
wget http://file.com/something.txt (download a file onto server)
wget -O newname.txt http://file.com/something.txt (download file with newname)
```

#### Using cURL
```
curl -o newname.txt http://file.com/something.txt (save as newname.txt)
curl -O http://file.com/something.txt (save as something.txt)
curl -O url_1 -O url_2 (etc.. Download multiple files)
```

## Find
```
find . -name tecmint.txt
find /home -name tecmint.txt
find /home -iname tecmint.txt (case ignore)
find / -type d -name Tecmint (directory)
find . -type f -perm 0777 -print (with perms)
find / -type f ! -perm 777 (find without)
find . -type f -name "tecmint.txt" -exec rm -f {} \; (find and remove a file)
find . -type f -name "*.txt" -exec rm -f {} \; (find and remove multiple)
find /tmp -type f -empty (Find empty files)
find /tmp -type d -empty (find empty directories)
find / -size +50M -size -100M (findby swize)
```

## Grep (Find in Files)

Some flags:
- `-r` is Recursive
- `-n` is Line Number
- `-w` Match the whole word
- `-l` is lowercase only

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
php -i | grep ini

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