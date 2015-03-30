# Apache

- Setup virtualhost in `/home/jesse/projects` (Or wherever your goods will be). 
- Once completed, access `http://projects`

### VHost
Create a file with `$ touch /etc/apache2/sites-available/projects.conf`:

    ServerName projects
    <VirtualHost *:80>
        DocumentRoot "/home/jesse/projects"
    </VirtualHost>
    
    <Directory /home/jesse/projects>
        Options FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>

- Enable the site with `$ sudo a2ensite projects.conf`
- Make sure your directory exists before restarting, otherwise errors occur.
- Activate the site with `$ sudo service apache2 restart`

### Edit Hosts File

Edit the hosts file, `$ sudo vim /etc/hosts` file and add or append to the exists `127.0.0.1` record.

    127.0.0.1 localhost projects
