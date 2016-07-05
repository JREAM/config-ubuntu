# Terminal

This will help you with terminal commands

# Table of Contents
- [Basics](#basics)
- [Listing and Navigating](#listing-and-navigating)
- [Zipping](#zipping)
- [OS Shutdown](#os-shutdown)
- [Crontab](#crontab)
- [Services](#services)
- [System State](#system-state)
- [Processes](#processes)
- [Users](#users)
- [MySQL](#mysql)
- [Download Files](#download-files)
- [Find](#find)
- [Find In Files](#find-in-files)
- [Grep](#grep)
- [SCP](#scp)
- [SSH](#ssh)

---

## Basics
```
whereis bash (find absolute location of bash, or any file)
whatis ls (tells you about the command)
man ls (manual to give you a list of all command arguments for any command)
locate crontab (I like mlocate more)
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

## File Permissions
```
chmod ug+rwx file.txt
chgrp group file.txt
chown user:group file.txt
```

## Users
```
su - username (switch users)
sudo su (switch to root)

passwd (change your pass)
passwd username (change another users pass)
```

## MySQL
```
mysql -u root -p (username, password prompt)
mysql -u root -p -h localhost (username, password prompt, host)
```

## Download Files
```
wget http://file.com/something.txt (download a file onto server)
wget -O newname.txt http://file.com/something.txt (download file with newname)

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

## Find In Files
```
-r is Recursive
-n is Line Number
-w Match the whole word
-l is lowercase only 

grep -rnw /path - "pattern_or_string"

# Output File
grep -rnw /path - "pattern_or_string" > output.txt
```

## Grep
```
grep "hello" file.txt (if in file)
grep "hello" files*  (if in many files)
grep -i "hello"  file.txt  (case insesitive)
grep -iw "is" file.txt (get full words, case insensitive)
grep "regex" file.txt
```

## SCP
```
scp root@server.com:/path/to/file.txt file.txt (Download to from server to local)
scp file.txt root@server.com:/path/to/file.txt (Upload from local to server)
```

## SSH
```
ssh name@server.com  (default port is 22)
ssh name@server.com -p 8000 (connect to specific port)
ssh name@server.com -i ~/.ssh/rsa_key.pub (connect with ssh key)
```
