Please Please Please use Linux/Mac ( Mac ? :| )

This is a quick note I created as I tried many of this setup things before, please read it carefully as it will really help you while setup your environment.

# Version control
Install git, you are **FORCED** to do !

# Ruby environment and package management
You can install any environment manager for ruby, such as **rbenv**,rvm or any other one I used rvm and rbenv and I recommend using rbenv.

Here you can find an awesome [walk-through](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04) for installing it

> Please be careful and make a quick post-scan before copying and pasting commands, this will make your life easier **check the .bashrc config instead of .bash_profile for ubuntu for example**

> Please double check steps with other distros.

Also, this is a [cool plugin](https://github.com/sstephenson/rbenv-gem-rehash) for not running the silly `rbenv rehash` each time you install/uninstall a gem

## **Don't install node when the tutorial asks you for, we will install it from source better for some package compatibility later**

# NodeJS
I found that they now suggest this [bash script](https://github.com/taaem/nodejs-linux-installer/releases) that makes it for you, I didn't try it yet but it looks cool

For node installation I would prefer [building it from source](https://github.com/taaem/nodejs-linux-installer/blob/master/node-install.sh), download the **source code** from [here](https://nodejs.org/en/download/)

After this it's **highly recommended** to fix the permissions for global node modules, you can check the **2nd** option [here](https://docs.npmjs.com/getting-started/fixing-npm-permissions#option-2-change-npm-s-default-directory-to-another-directory)

# Text Editor
Use anything, if you are going to use some IDE please make sure you gitignore it's files, support me and use atom :smiley:

-----

That's it for the current setup I think, Others will be later, if you need to get some of them from now because your internet speed is good consider downloading [Android studio](http://developer.android.com/sdk/index.html), PostMan or any RESTful API interaction app.
