---
title: php.ini
date: 2013-12-27 16:00
authors: JacBac
categories: php
tags: php, ini

layout: posts

---


PHP Warning: Module 'modulename' already loaded in Unknown on line 0
This page describes how to resolve the following PHP warning: PHP Warning: Module 'modulename' already loaded in Unknown on line 0

Problem

When running the CLI version of PHP from the command line, you may receive errors like the following:

[root@myserver /root]$ php -v 
PHP Warning: Module 'pcre' already loaded in Unknown on line 0 
PHP Warning: PHP Startup: Unable to load dynamic library '/usr/local/php5/lib/php/extensions/no-debug-non-zts-20060613/spl.so' - /usr/local/php5/lib/php/extensions/no-debug-non-zts-20060613/spl.so: Undefined symbol "pcre_exec" in Unknown on line 0 
PHP Warning: Module 'SimpleXML' already loaded in Unknown on line 0 
PHP Warning: Module 'session' already loaded in Unknown on line 0 
PHP Warning: Module 'exif' already loaded in Unknown on line 0 
PHP 5.2.3 (cli) (built: Jun 14 2007 15:29:17) 
Copyright (c) 1997-2007 The PHP Group 
Zend Engine v2.2.0, Copyright (c) 1998-2007 Zend Technologies

Cause

There are two ways to load most extensions in PHP. One is by compiling the extension directly into the PHP binary. The other is by loading a shared extension dynamically via an ini file. The errors indicate that dynamic extensions are being loaded via .ini files, even though they are already compiled into the PHP binary.

Fix

To fix this problem, you must edit your php.ini (or extensions.ini) file and comment-out the extensions that are already compiled-in. For example, after editing, your ini file may look like the lines below:

;extension=pcre.so
;extension=spl.so
;extension=simplexml.so
;extension=session.so
;extension=exif.so
You may also erase those lines instead of commenting them out. Once you have disabled those lines, run php -v to see if the warnings go away.

Additional Info

To see which extensions are compiled-in to your PHP binary, run the following command:

php -m
You can also view the configure command, which will show which extensions are enabled and compiled-in, or built as shared, dynamic modules.

php -i | grep Configure
The dynamic extensions are usually located in a special "extensions" folder, which varies by operating system environment. Your php.ini usually has a line that describes where the folder is located. For example:

; Directory in which the loadable extensions (modules) reside.
extension_dir = "/usr/local/php5/lib/php/extensions/no-debug-non-zts-20060613/"





php -i | grep timezone

php -i | grep apc
