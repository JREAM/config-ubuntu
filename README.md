# Ubuntu Config - Install Tool

The goal is to make setting up ubuntu easy.

<!-- TOC -->

- [Ubuntu Config - Install Tool](#ubuntu-config---install-tool)
	- [Step 1: Install](#step-1-install)
		- [Option 1: Install Binary Manually](#option-1-install-binary-manually)
		- [Option 2: Install Default Version APT](#option-2-install-default-version-apt)
		- [Option 3: Install Specific Version via APT](#option-3-install-specific-version-via-apt)
		- [Option 4: Install via NVM](#option-4-install-via-nvm)
			- [NVM: Autoload Bash](#nvm-autoload-bash)
			- [NVM: Install Node Version](#nvm-install-node-version)
	- [Step 2: Install Local Packages](#step-2-install-local-packages)
	- [Usage](#usage)
	- [Testing](#testing)

<!-- /TOC -->

---

## Step 1: Install

Node is required, install NodeJS first.

### Option 1: Install Binary Manually

Download LTS version at: [nodejs.org](https://nodejs.org)

### Option 2: Install Default Version APT

```sh
# npm may not be required depending on the default version
sudo apt install nodejs npm -y
```

### Option 3: Install Specific Version via APT

This way allows you to choose a version:

```sh
# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
```

> For more details and versions see [Debian/Ubuntu Snap Install](https://github.com/nodesource/distributions/blob/master/README.md#debinstall)


### Option 4: Install via NVM

This installs nvm to your `$HOME` folder under `.nvm`:

```sh
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```

#### NVM: Autoload Bash

Edit your ~/.bashrc or related file autoloaded so that `nvm` is loaded on startup.

```sh
if [ -d ~/.nvm ]; then
  export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi
```

Make sure to re-source your bash file, or load a new terminal to apply the path:

```sh
. ~/.bashrc
```

#### NVM: Install Node Version

See available node versions

```sh
nvm ls-remote
```

I suggest using an LTS (Long Term Support) version.

Example Installing and setting a default version:

```sh
nvm install 10.16.0
nvm alias default 10.16.0
```

## Step 2: Install Local Packages

You must install the `package.json` dependencies:

```sh
yarn
# or
npm i
```

## Usage

You can use `Yarn` or `NPM`, simply run:

```sh
yarn start
# or
npm start
```

## Testing

Like the default using, call with `Yarn` or `NPM`:

```sh
yarn test
# or
npm test
# if npm gives issues, try:
# npm run test
```

---

MIT License | Open Source

(c) Jesse Boyer | [JREAM](https://jream.com)
