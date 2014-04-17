---
title: Post-install Ubuntu Distrib
date: 2013-11-25 13:52
authors: JacBac
categories: linux
tags: debian, distribution
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

---

After you install brand new Ubuntu 13.04, the first thing you need to do is to update repositories and make sure you have the latest updates installed.

```
sudo apt-get update && sudo apt-get upgrade
```

Install the "ubuntu-restricted-extras" package. This will enable your Ubuntu to play popular file formats like mp3, avi, flash videos etc.

```
sudo apt-get install ubuntu-restricted-extras
```

Prepare
-------

### ZSH & Oh My ZSH

https://github.com/robbyrussell/oh-my-zsh

```
sudo apt-get install zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```


### Vim

```
sudo apt-get install vim
```

### Create workspace folder

```
cd /home/{USER_NAME}/
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

add to .bashrc file

```
# colorized man, needs to install most
export PAGER=most
```

Progz Install
-------------

### Update PPAs

* Sublime-text 3
* Mozilla

```
sudo add-apt-repository ppa:webupd8team/sublime-text-3 && sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
```

### Install

#### Dev environment

##### Vagrant

Download Vagrant and install

sudo dpkg -i vagrant_versionxxx.deb

Download Puppet and install

sudo dpkg -i 

Create a new folder vagant

mkdir vagrant && cd vagrant && mkdir ubuntu_lamp && ubuntu_node


https://wiki.debian.org/LaMp

##### MySQL

```
sudo apt-get install mysql-server mysql-client

a new root password is ask. Set a strong password for root
```

##### apache2

```
sudo apt-get install apache2 apache2-doc
```

Configuring user directories for Apache Web Server

Enable module userdir

```
sudo a2enmod userdir
```

##### php5

```
sudo apt-get install php5 php5-mysql libapache2-mod-php5
```

php-pear ???

##### phpMyAdmin

```
sudo apt-get install phpmyadmin
```






WIP http://gorails.com/setup/ubuntu

* MySql
* Apache 2
* PHP 5

* Curl
* Composer

* Git
* Gimp
* Filezilla






* Redmine
* SonarQube
* php-console
* personnal projects with VHost
* apache2 config
* git config
* dot-files
* dev personnal directorys
* virtual boxes
* sublime-text 3 with package control
* chrome with some extensions



* Curl

```
sudo apt-get install curl
sudo apt-get install php5-curl (needed ?)
curl --version
```

* Composer

Globally#

You can place this file anywhere you wish. If you put it in your PATH, you can access it globally. On unixy systems you can even make it executable and invoke it without php.

You can run these commands to easily access composer from anywhere on your system:

```
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
composer --version
```

Note: If the above fails due to permissions, run the mv line again with sudo.

Then, just run composer in order to run Composer instead of php composer.phar.

* Git

If you don't already have a Github account, make sure to register. Then

```
sudo apt-get install git
git --version

git config --global color.ui true
git config --global user.name "{YOUR_NAME}"
git config --global user.email "{YOUR_@_MAIL.com}"
```

After that, install sublime [Package-Control](https://sublime.wbond.net/installation)

and the packages :
* GitGutter
* SideBarEnhancements
* DocBlockr
* LESS-sublime
* Markdown Preview
* FileDiffs


A installer et tester
* less2css (après install de node.js et lessc)


* Filezilla

```
sudo apt-get install filezilla filezilla-common
```


### Clef SSH WIP

ssh-keygen -t rsa -C "{YOUR_@_MAIL.com}"

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

* Node.js

```
sudo add-apt-repository ppa:chris-lea/node.js (marche pas sous Debian)
sudo apt-get update
sudo apt-get install nodejs
```


#### Multimedia app

```
sudo apt-get install gimp vlc
```





#### Update installed stack WIP

```
rails -v
ruby -v
sudo gem update
sudo composer self-update
```


#### Laptop config

Jupiter is No More, TLP Looks Like a Good Alternative

```
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
```

Configz
-------

### Adding current user to www-data group

```
sudo adduser $LOGNAME www-data
```



### Find apache log :

To find exact apache log file location, you can use grep command:

```
/usr/sbin/apachectl -V

and

grep ErrorLog /usr/local/etc/apache22/httpd.conf
grep ErrorLog /etc/apache2/apache2.conf
grep ErrorLog /etc/httpd/conf/httpd.conf
```
