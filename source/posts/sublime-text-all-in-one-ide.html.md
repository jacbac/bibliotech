---
title: Sublime Text Editor
date: 2013-12-21 14:00
authors: JacBac
categories: ide, sublime
tags: ide, plug-ins, install
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

---

## Install

[Official page](http://www.sublimetext.com/)


## Pimp my [r]ide !

Let'start by the mother of all sublime plug-ins : Package Control.

The simplest method of installation is through the Sublime Text console. The console is accessed via `View > Show Console menu`. Once open, paste the the Python code into the console.

```
import urllib.request,os; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ','%20')).read())
```

## Sublime Text packages

### Sidebar Enhancements

[Sidebar Enhancements](https://sublime.wbond.net/packages/SideBarEnhancements)

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "SideBarEnhancements" and click enter.

## QA Tools

### Doc​Blockr

[Doc​Blockr](https://sublime.wbond.net/packages/Doc​Blockr)

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "Doc​Blockr" and click enter.

#### Basic usage

Type `/**` or `/*` then enter

### PHP CS-Fixer

Requires `php-cs-fixer` to work.

[PHP CS-Fixer](https://sublime.wbond.net/packages/Phpcs)

The PHP Coding Standards Fixer tool fixes most issues in your code when you want to follow the PHP coding standards as defined in the PSR-1 and PSR-2 documents.
[CS-Fixer on Sensio-Labs](http://cs.sensiolabs.org)

#### Basic usage

Auto-correct files on save (`Ctrl+S`), according to basic or user rules.



#### Sublime Linter

[]()

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "SublimeLinter" and click enter.

#### CSSLint

Requires `NodeJS` and `csslint` node package to work

[CSSLint](https://sublime.wbond.net/packages/SublimeLinter-csslint)

    npm install -g csslint

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "CSSLint" and click enter.

#### Basic usage

Search for `CSSLint: Run CSSLint` from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X or use a keyboard shortcut (by default this is `Ctrl+Alt+C`).

Change this by adding something like the following to your key bindings:

{ "keys": ["ctrl+alt+c"], "command": "csslint" }

#### JSLint

Requires `NodeJS` to work.

[JSLint](https://sublime.wbond.net/packages/JSLint)

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "JSLint" and click enter.

#### Alignment

[Alignment](https://sublime.wbond.net/packages/Alignment)

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "Alignment" and click enter.

#### Basic usage

Make a multi-line selection, or multiple selections
Press `Ctrl+Alt+A` on Windows and Linux, or `Cmd+Ctrl+A` on OS X

#### Less2Css

Requires `lessc` installed on `PATH`.

[Less2Css](https://sublime.wbond.net/packages/Less2Css)

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "Less2Css" and click enter.

### Git

#### Git Gutter

[GitGutter](https://sublime.wbond.net/packages/GitGutter)

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "GitGutter" and click enter.

### Markdown

#### Markdown Preview

[Markdown Preview](https://sublime.wbond.net/packages/Markdown%20Preview)

Provides markdown preview in browser.

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "LESS" and click enter.

#### Basic usage

### Syntax highlighting

#### Monokai Extended

[Monokai-Extended](https://github.com/jisaacks/sublime-monokai-extended)

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "Monokai Extended" and click enter.

#### LESS

[LESS Highlighting](https://sublime.wbond.net/packages/LESS)

Provides syntax highlighting for .less files, along with snippets and completions.

Select "Install Package" from the Command Palette: `Ctrl+Shift+P` on Windows and Linux or `⇧⌘P` on OS X
Search for "LESS" and click enter.

### Theme



### Need portage in Sublime-Text 3 (OK ST-2)

[ColorHighlighter](https://sublime.wbond.net/packages/Color%20Highlighter)


