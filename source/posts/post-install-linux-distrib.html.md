---
title: Post-install Linux Distrib
date: 2013-11-25 13:52
authors: JacBac
categories: linux
tags: debian, distribution
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

---

Tested OK on

* Ubuntu 13.10 with Gnome 3
* Debian 7.2 Wheezy with Gnome 3 (somes install differ, so google it if it don't work)

## Let's start !

```
sudo apt-get update && sudo apt-get upgrade
```

## Essentials build tools

```
sudo apt-get install build-essential make
```

## Vim

```
sudo apt-get install vim
vim -v
```

## Git

```
sudo apt-get install git-core gitk
git --version

git config --global color.ui true
git config --global user.name "{YOUR_NAME}"
git config --global user.email "{YOUR_@_MAIL.com}"
```

### Curl

```
sudo apt-get install curl php5-curl
curl --version
```

## ZSH & Oh My ZSH

[Oh My ZSH official](https://github.com/robbyrussell/oh-my-zsh)

```
sudo apt-get install zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
zsh --version
chsh -s /bin/zsh
```

### Set the Agnoster theme for Oh My ZSH

[OMZSH Theme](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes)
[Agnoster install](https://gist.github.com/agnoster/3712874)

First, do the [test for special characters](https://gist.github.com/agnoster/3712874) to let you know if you support the extended Power Vim font.

```
echo "⮀ ± ⭠ ➦ ✔ ✘ ⚡"
```

If not, download the font and the fontconfig and do the [fontconfig instructions](https://powerline.readthedocs.org/en/latest/installation/linux.html#fontconfig) (download links are in the last link).

Then enable the Agnoster theme in OMZSH

```
vim ~/.zshrc
ZSH_THEME="agnoster"
```

optionally set `DEFAULT_USER` in `~/.zshrc` to your regular username to hide the `“user@hostname”`` info when you’re logged in as yourself on your local machine.

### Set the common-aliases plugin for Oh My ZSH

[Common-aliases OMZSH plugin](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#common-aliases)

Collection of useful common aliases (about `cd`, `list`, etc.), not enabled by default since they may change some user defined aliases.

```
vim ~/.zshrc
plugins=(git common-aliases)
```

### Set the dircycle plugin for Oh My ZSH

[Dircycle OMZSH plugin](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#dircycle)

Navigate trough directory with `Ctrl + Shift + Left/Right`

```
vim ~/.zshrc
plugins=(git common-aliases dircycle)
```

### Set the Symfony 2 plugin for Oh My ZSH

[Symfony 2 OMZSH plugin](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#symfony2)

Give you autocompletion for symfony 2 console `app/console`.
Some alias

```
vim ~/.zshrc
plugins=(git common-aliases dircycle symfony2)
```

### Set the Sublime-Text plugin for Oh My ZSH

[Sublime-Text OMZSH plugin](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#sublime)

Open a file in sublime-text with `st <file>` or a directory with `stt <dir>`

```
vim ~/.zshrc
plugins=(git common-aliases dircycle symfony2 sublime)
```

## Add some PPA & Mozilla's

Sublime-Text 3 Beta

```
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
```

```
sudo apt-get install firefox
sudo apt-get install thunderbird
```

## LAMP env

[Wiki Debian LAMP](https://wiki.debian.org/lamp)

### MySQL

```
sudo apt-get install mysql-server mysql-client

a new root password is ask. Set a strong password for root
```

### Apache 2

```
sudo apt-get install apache2 apache2-doc
```

### Apache2 mods

```
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod expires
sudo a2enmod deflate
sudo a2enmod setenvif
sudo a2enmod macro

sudo service apache2 restart
```

### PHP 5

```
sudo apt-get install php5 php5-mysql libapache2-mod-php5
```

### PHPMyAdmin

```
sudo apt-get install phpmyadmin
```

### APC

```
sudo apt-get install php-apc
```

### Composer

You can place this file anywhere you wish. If you put it in your PATH, you can access it globally. On unixy systems you can even make it executable and invoke it without php.

You can run these commands to easily access composer from anywhere on your system:

```
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
composer --version
```

Note: If the above fails due to permissions, run the mv line again with sudo.
Then, just run composer in order to run Composer instead of php composer.phar.

### Pecl, make, pear

PECL is a repository for PHP Extensions, providing a directory of all known extensions and hosting facilities for downloading and development of PHP extensions.

The packaging and distribution system used by PECL is shared with its sister, PEAR.

```
sudo apt-get install php5-dev php-pearmake
```

#### Imagick

```
sudo pecl install imagick
```

#### XDebug

[XDebug official](http://xdebug.org/docs/install)

```
sudo pecl install xdebug

note install directory
ex. /usr/lib/php5/20100525/xdebug.so

add to php.ini the xdebug extension

sudo vim /etc/php5/apache2/php.ini

zend_extension="/usr/lib/php5/20100525/xdebug.so"

sudo service apache2 restart
```

Now use some var_dump() and see the results :)



## Node.js env

Install both `node.js` and `npm` (node package manager) with

```
sudo apt-get install nodejs
node -v
npm -v
```

### Less

```
npm install -g less
```

Compile with 

```
lessc input.less > output.css -x
```


## Ruby env

[GoRails install help](http://gorails.com/setup/ubuntu/13.10)

### With OS package

```
sudo apt-get install ruby
As of writing, the ruby package provides Ruby 1.9.3, which is an old stable release, on Debian and Ubuntu.

ruby -v
```

### With Rbenv

[Rbenv official](https://github.com/sstephenson/rbenv)

If ZSH is already installed, change the following end of lines with `~/.bashrc` by `~/.zshrc`.

```
sudo apt-get install -y libssl-dev zlib1g-dev libreadline-dev

cd ~/
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
```

Then you can list, search, get the ruby version you want and define a specific version as global

```
rbenv install --list

rbenv install 2.1.1
rbenv global 2.1.1
ruby -v

rbenv rehash
```

The last step is to tell Rubygems not to install the documentation for each package locally

```
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
```

## NoSQL env

### MongoDB

[Official MongoDB page](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-debian/) (2013/11/05)

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install mongodb-10gen
mongodb-10gen --version
```

### Rockmongo

[Official Rockmongo page](http://rockmongo.com/wiki/installation) (2013/11/06)

```
download the package
unzip the files to your disk, under root of your site (or /workspace/tool)
open the config.php with your convenient editor, change host, port, admins and so on to yours
```

then create a new vhost for facility access

```
sudo vim /etc/hosts

127.0.0.1   rockmongo

cd /etc/apache2/sites-available/
sudo vim tool_rockmongo.conf
```

add (adapt path before making a dummy copy)

```
<VirtualHost *:80>

    ServerName rockmongo

    DocumentRoot /home/{path_to}/workspace/tool/rockmongo
    DirectoryIndex index.php
    <Directory /home/{path_to}/workspace/tool/rockmongo>
        AllowOverride All
        Allow from all
    </Directory>

    CustomLog /var/log/apache2/access.tool_rockmongo.log combined
    ErrorLog /var/log/apache2/error.tool_rockmongo.log

</VirtualHost>
```

then 

```
sudo a2ensite tool_rockmongo.conf
sudo service apache2 reload
```

Need to install also php_mongo module

```
sudo pecl install mongo
```

then add the following line to your php.ini file:

WIP 

```
sudo vim /etc/php5/apache2/php.ini /etc/php5/cli/php.ini -p
extension = mongo.so

sudo service apache2 restart
```

At the end, visit the `http://rockmongo/` page

As default,

```
login : admin
password : admin
```

Note : If pecl runs out of memory while installing, make sure memory_limit in php.ini is set to at least 128MB.



## Virtual env

WIP WIP WIP

### Vagrant

Download Vagrant and install

```
sudo dpkg -i vagrant_versionxxx.deb
```

Download Puppet and install

```
sudo dpkg -i xxx
```

Create a new vagrant folder

```
mkdir vagrant && cd vagrant && mkdir ubuntu_lamp && ubuntu_node
```

WIP

### VirtualBox

[VirtualBox official](https://www.virtualbox.org/wiki/Linux_Downloads)


## Multimedia env

Install the "ubuntu-restricted-extras" package. This will enable your Ubuntu to play popular file formats like mp3, avi, flash videos etc.

Gimp & VLC too !

```
sudo apt-get install ubuntu-restricted-extras gimp vlc
```

And let's take a look at [webupd8.org](http://www.webupd8.org/2014/04/10-things-to-do-after-installing-ubuntu.html) for fresh post-install helps and others reminders.

## System env

```
sudo apt-get install htop
htop --version
```


## FTP env

```
sudo apt-get install filezilla filezilla-common
```


## Various config

### Create workspace folder

```
cd ~/
mkdir workspace
```

### Grant access

```
apt-get install sudo
```

### Colorize man pages

```
sudo apt-get install most
```

then add to `.bashrc` or `.zshrc` file

```
echo "# colorized man, needs to install most" > ~/.zshrc
echo "export PAGER=most"  > ~/.zshrc
```

### Adding current user to www-data group

```
sudo adduser $LOGNAME www-data
```

### SSH security

```
mkdir ~/.ssh
chmod 700 ~/.ssh -R
```

### Set a SSH key

```
ssh-keygen -t rsa -C "{YOUR_@_MAIL.com}"
```

#### For Github

The next step is to take the newly generated SSH key and add it to your Github account. You want to copy and paste the output of the following command and paste it [here](https://github.com/settings/ssh).

```
cat ~/.ssh/id_rsa.pub
```

Once you've done this, you can check and see if it worked:

```
ssh -T git@github.com
```

You should get a message like this:

```
Hi {YOUR_GITHUB_NAME}! You've successfully authenticated, but GitHub does not provide shell access.
```

### Set a user friendly usr/local folder

Just in case...

```
sudo chown -R $USER /usr/local
```

### Set PHP Timezone

```
sudo vim /etc/php5/apache2/php.ini /etc/php5/cli/php.ini -p
=> date.timezone = Europe/Paris
```

### Set PHP for phar archives & APC:

Here some basics configurations

```
sudo vim /etc/php5/apache2/php.ini /etc/php5/cli/php.ini -p

add to phar

[Phar]
; http://php.net/phar.readonly
phar.readonly = Off

; http://php.net/phar.require-hash
phar.require_hash = Off

detect_unicode = Off
suhosin.executor.include.whitelist = phar

# Add:

apc.enabled = 1
apc.enable_cli = 1
```

## Others TODO

* APC fine config
* Redmine
* SonarQube
* php-console
* basics VHost & apache2 macro-based vhost config
* git config
* dot-files
* dev personnal directorys
* vagrant/puppet config
* chrome with some extensions list
