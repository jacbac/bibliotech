---
title: LogLevel Apache
date: 2013-11-25 13:52
authors: JacBac
categories: apache
tags: debug, apache, serveur
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

---

```shell
sudo vim /etc/apache2/apache2.conf
```


```shell
# LogLevel: Control the number of messages logged to the error_log.
# Possible values include: debug, info, notice, warn, error, crit, alert, emerg.
LogLevel notice
```

debug < info < notice < warn < error < crit < alert < emerg.


| LogLevel        | Expect        |
| :-------------- |:--------------|
| Trace           | Only when I would be "tracing" the code and trying to find one part of a function specifically |
| Debug           | Information that is diagnostically helpful to people more than just developers (IT, sysadmins, etc) |
| Info            | Generally useful information to log (service start/stop, configuration assumptions, etc). Info I want to always have available but usually dont care about under normal circumstances. This is my out-of-the-box config level |
| Warn            | Anything that can potentially cause application oddities, but for which I am automatically recoverring (such as switching from a primary to backup server, retrying an operation, missing secondary data, etc) |
| Error           | Any error which is fatal to the operation but not the service or application (cant open a required file, missing data, etc). These errors will force user (administrator, or direct user) intervention. These are usually reserved (in my apps) for incorrect connection strings, missing services, etc. |
| Fatal           | Any error that is forcing a shutdown of the service or application to prevent data loss (or further data loss). I reserve these only for the most heinous errors and situations where there is guaranteed to have been data corruption or loss |
