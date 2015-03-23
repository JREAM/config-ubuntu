# Git
I prefer Git 2.X, so I'll use a PPA. Otherwise you can simply install git by default.

    sudo add-apt-repository ppa:git-core/ppa -y

**Install the Utilities:**

    sudo apt-get install -y vim git mercurial meld curl htop xclip terminator gdebi preload bleachbit ubuntu-restricted-extras

To setup the git defaults *(Omit the `push.default` if you are using below 2.X)*

    git config --global push.default simple
    git config --global user.name your name
    git config --global user.email your@email.com

That will create a `~/.gitconfig` with:

    [user]
        email = aniyishay@gmail.com
        name = Jesse Boyer
    [push]
        default = simple