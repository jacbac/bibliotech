---
title: Apache config
date: 2013-11-25 13:52
authors: JacBac
categories: apache
tags: log, debug, apache, server
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

---

## Apache Macro VHost

[Thanks to the revelator Ronan Guilloux](https://gist.github.com/ronanguilloux/8452588)
[Exemples and links](https://people.apache.org/~fabien/mod_macro/)
[Another example](https://blog.natulte.net/posts/2008-04-29-apache-configuration-with-modmacro.html)

### Install

```
sudo apt-get install libapache2-mod-macro
sudo a2enmod macro
sudo service apache2 restart
```

A thing you need to remember when making macros, is that the file defining your macros needs to be included in Apache's configuration files somewhere, or else you will not be able to use them. I would suggest you to make a file called `macro.conf` inside the folder `/etc/apache2/conf.d/`, since all files in that folder automatically get included by Apache.

So copy & paste this below inside a new `/etc/apache2/conf.d/macro.conf` file:

```
<Macro VHost $apacheversion $path $prepend $host $port>
    <VirtualHost *:$port>

        Servername $host
        ServerAlias $host.loc

        DocumentRoot $path/$host/web

        # dir definitions, old or new
        <Directory $path/$host/web>
            Use $apacheversion
        </Directory>

        SetEnvIf Request_URI "\.(ico|pdf|flv|jpg|jpeg|png|gif|js|css|swf|txt|cur)$" dontlog
        SetEnvIf Request_URI "^_" dontlog
        SetEnvIf Request_URI "^/_" dontlog

        # Logs
        LogFormat "%V %h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" \"%{cookie}i\" test" combined_cookie_vhost
        CustomLog ${APACHE_LOG_DIR}/access.$prepend_$host.com.log combined_cookie_vhost env=!dontlog
        ErrorLog ${APACHE_LOG_DIR}/error.$prepend_$host.log
        Use LogLevel $level

        <IfModule mod_expires.c>
            ExpiresActive on
            ExpiresByType text/css                  "access plus 0 seconds"
            ExpiresByType application/javascript    "access plus 0 seconds"
        </IfModule>
        
        <IfModule mod_headers.c>
            Header set X-UA-Compatible: "IE=edge,chrome=1"
        </IfModule>

    </VirtualHost>
</Macro>

# Apache version 2.2
<Macro old>
        Options FollowSymLinks

        # enable the .htaccess rewrites
        AllowOverride All

        # permissions
        Order allow,deny
        Allow from All
</Macro>

# Apache version 2.4
<Macro new>
        Options FollowSymLinks

        # enable the .htaccess rewrites
        AllowOverride All

        # permissions
        Require all granted
</Macro>

<Macro LogLevel $level>
    # Possible values include: trace[8-1], debug, info, notice, warn, error, crit, alert, emerg.
    LogLevel $level
</Macro>
```

### Usage:

```
echo "Use VHost old warn" > /etc/apache2/sites-available/myMacroBasedNewVHostName.conf
sudo a2ensite myMacroBasedNewVHostName.conf
sudo service apache2 reload
```

Here's the options

| Variables       | Use           |
| :-------------- |:--------------|
| $apacheversion  | old (apache 2.2) || new (apache 2.4)|
| $path           | the path to host |
| $prepend        | add a prefix to logs name. ex. error.tool_your_site.log, error.v4_your_site.log|
| $host           | the host name|
| $port           | 80, 8080, ...|


## Apache uprade to 2.4

According to the new configuration file, the the enabled virtual host config files need to be under sites-enabled directory and these files mush have `.conf` extension. The simplest way is deleting all virtual host config files under sites-enabled, rename the existing config files under sites-available with extension .conf and re-enable with `a2ensite` command.

All of the access control directives from the virtual host config and `.htaccess` files are needed to change to newer directives.

```
Apache 2.2.*
    Order deny,allow
    Deny from all

Apache 2.4.*
    Require all denied

Apache 2.2.*
    Order allow,deny
    Allow from all

Apache 2.4.*
    Require all granted

Apache 2.2.*
    Order Deny,Allow
    Deny from all
    Allow from example.org

Apache 2.4.*
    Require host example.org
```


## Apache Logs

[](https://www.digitalocean.com/community/articles/how-to-configure-logging-and-log-rotation-in-apache-on-an-ubuntu-vps)

### Logs path

To find exact apache log file location, you can use `grep` command:

```
/usr/sbin/apachectl -V

and

grep ErrorLog /etc/apache2/apache2.conf
```


### Log level

```
sudo vim /etc/apache2/apache2.conf
```


```
# LogLevel: Control the number of messages logged to the error_log.
# Possible values include: debug, info, notice, warn, error, crit, alert, emerg.
LogLevel notice
```

debug < info < notice < warn < error < crit < alert < emerg.


| LogLevel        | Expect        |
| :-------------- |:--------------|
| Trace[1-8]      | Tracing information of various levels of verbosity that produces a large amount of information|
| Debug           | Information that is diagnostically helpful to people more than just developers (IT, sysadmins, etc) |
| Info            | Generally useful information to log (service start/stop, configuration assumptions, etc). Info I want to always have available but usually dont care about under normal circumstances. This is my out-of-the-box config level |
| Notice          | Something normal, but worth noting has happened|
| Warn            | Anything that can potentially cause application oddities, but for which I am automatically recoverring (such as switching from a primary to backup server, retrying an operation, missing secondary data, etc) |
| Error           | Any error which is fatal to the operation but not the service or application (cant open a required file, missing data, etc). These errors will force user (administrator, or direct user) intervention. |
| Crit            | Any error that is forcing a shutdown of the service or application to prevent data loss (or further data loss). |
| Alert           | Severe situation where action is needed promptly|
| Emerg           | Emergency situations where the system is in an unusable state.|
