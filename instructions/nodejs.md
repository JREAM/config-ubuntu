## NodeJS
I am using a PPA to fix the nodejs path issue(s)

    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install nodejs
    sudo chown -R $(whoami) ~/.npm
    sudo npm install bower gulp grunt-cli -g

If installing coffee-script and typing `$ coffee` produces an error, make sure coffee is not within the $PATH

    echo $PATH

**Upgrade NodeJS**

Clear NPM's cache:

    sudo npm cache clean -f

Install a helper called `n`

    sudo npm install -g n

Install latest stable NodeJS version

    sudo n stable

Or pick a specific version:

    sudo n 0.8.20