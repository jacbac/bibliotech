---
title: Post-install Debian Distrib
date: 2013-11-25 13:52
authors: JacBac
categories: linux
tags: debian, distribution
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

---

Debian 7.2 Wheezy
Gnome Desktop

Logiciel installé par défaut

* Icedove ?


Note d'introduction :

aptitude est installé par défaut.
La syntaxe `apt-get ...` peut donc être remplacé par `aptitude ...` si besoin.


### Mises à jour officielles

```
sudo apt-get update && sudo apt-get upgrade
```

#### Vim

```
sudo apt-get install vim
```

#### Git & gitk

sudo apt-get install git

sudo apt-get install gitk



### LAMP env

[https://wiki.debian.org/lamp](https://wiki.debian.org/lamp)

##### MySQL

```
sudo apt-get install mysql-server mysql-client

a new root password is ask. Set a strong password for root
```

##### Apache 2

```
sudo apt-get install apache2 apache2-doc
```

###### Apache2 mods

```
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod expires
sudo a2enmod deflate
sudo a2enmod setenvif

sudo service apache2 restart
```

##### PHP 5

```
sudo apt-get install php5 php5-mysql libapache2-mod-php5
```

##### PHPMyAdmin

```
sudo apt-get install phpmyadmin
```


### Other ressources

#### Pecl, make, pear

PECL is a repository for PHP Extensions, providing a directory of all known extensions and hosting facilities for downloading and development of PHP extensions.

The packaging and distribution system used by PECL is shared with its sister, PEAR.

```
sudo apt-get install php5-dev php-pearmake
```

##### XDebug

Meilleur affichage des bugs 

http://xdebug.org/docs/install

```bash
sudo pecl install xdebug

noter le repertoire d'install (visible en console à la fin de l'install) ex. /usr/lib/php5/20100525/xdebug.so

ajouter à php.ini l'extension

sudo vim /etc/php5/apache2/php.ini

zend_extension="/usr/lib/php5/20100525/xdebug.so"

sudo service apache2 restart
```

Now you can use var_dump() WIP...

##### Imagick

? WIP

```
sudo pecl install imagick
```

#### MongoDB

[Official MongoDB page](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-debian/) (2013/11/05)

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install mongodb-10gen
mongodb-10gen --version
```


#### Rockmongo

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
sudo vim tool_rockmongo
```

add (adapt path before dummy copy)

```
<VirtualHost *:80>

    ServerName rockmongo

    DocumentRoot /home/jacques/workspace/tool/rockmongo
    DirectoryIndex index.php
    <Directory /home/jacques/workspace/tool/rockmongo>
        AllowOverride All
        Allow from all
    </Directory>

    CustomLog /var/log/apache2/access.tool_rockmongo.log combined
    ErrorLog /var/log/apache2/error.tool_rockmongo.log

</VirtualHost>
```

then 

```
sudo a2ensite tool_rockmongo
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

login : admin
password : admin


Note : If pecl runs out of memory while installing, make sure memory_limit in php.ini is set to at least 128MB.


#### Install APC Here ?

pecl install apc ????

WIP


#### Node.js

[Official Node.js page](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager) (2013/11/05)

install wheezy-backports support for debian

##### [Optionnel] Ajout de wheezy backports

Utile si vous installez `node.js`, sinon il est possible de compiler node soi-même (cf. lien)

Ouvrez en tant que super-utilisateur le fichier /etc/apt/sources.list avec votre éditeur de texte préféré :

human@debian:~$ su
Password:
debian:/home/human# nano /etc/apt/sources.list
Ajoutez les lignes suivantes :

# Backports repository
deb http://ftp.debian.org/debian wheezy-backports main contrib non-free
Si vous êtes un utilisateur militant des logiciels libres, vous pouvez retirer les sections contrib et non-free. (Voir Debian sections pour plus de détails.)

Une fois que vous avez ajouté le dépôt, mettez à jour le cache d'APT pour inclure les paquets backports dans la liste des paquets disponibles :

debian:/home/human# aptitude update
Voilà, c'est fait.



then

```
sudo apt-get install nodejs nodejs-legacy
```

##### Install NPM (Node Packet Manager)

If you need `npm` as well, you can get it through the installer

```
curl https://npmjs.org/install.sh | sudo sh
```

##### Install less & less compiler

```
npm install -g less
```

Now you can compile

```
lessc input.less > output.css -x
```

#### VirtualBox

[Official VirtualBox page](https://www.virtualbox.org/wiki/Linux_Downloads) (2013/11/07)

```
sudo vim /etc/apt/sources.list

add 
deb http://download.virtualbox.org/virtualbox/debian wheezy contrib

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-4.3
```

```
sudo apt-get install dkms
```


### Various

#### Adding current user to www-data group

```
sudo adduser $LOGNAME www-data
```

#### SSH security

```
mkdir ~/.ssh
chmod 700 ~/.ssh -R
```

#### Set PHP Timezone

```
sudo vim /etc/php5/apache2/php.ini /etc/php5/cli/php.ini -p
=> date.timezone = Europe/Paris
```

#### Set PHP for phar archives & APC:

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


### Gestion des processus

sudo apt-get install htop
htop --version




Version FR de Icedove

sudo apt-get install icedove-l10n-fr


### PHP Doc

http://www.phpdoc.org/docs/latest/getting-started/installing.html

sudo apt-get install graphviz

sudo pear channel-discover pear.phpdoc.org
sudo pear install phpdoc/phpDocumentor

When the installation is finished you can invoke the phpdoc command from any path in your system.


go to a project folder then

phpdoc -d ./src -t ./docs/api --template="clean"

-d : directory to document
-t : where goes documented files
--template : choose a template name

http://www.phpdoc.org/docs/latest/references/configuration.html


Plugin Sublime text

* Phpcs
