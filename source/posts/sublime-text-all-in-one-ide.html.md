---
title: Sublime Text Editor
date: 2013-12-21 14:00
authors: JacBac
categories: ide, sublime
tags: ide, plug-ins, install
banner: /posts_uploads/2013/11/nick-nolte.jpg

"sources": [
  {
    "label": "Sublime-Text Official",
    "href": "http://www.sublimetext.com/",
    "lang": "EN"
  },
  {
    "label": "Package Control",
    "href": "https://sublime.wbond.net/installation",
    "lang": "EN"
  },
  {
    "label": "Sublime-Text package repository",
    "href": "https://sublime.wbond.net/",
    "lang": "EN"
  },
]

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

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `SideBarEnhancements` and click enter.

### Alignment

[Alignment](https://sublime.wbond.net/packages/Alignment)

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `Alignment` and click enter.

### Color Highlighter

[Color Highlighter](https://sublime.wbond.net/packages/Color%20Highlighter)

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `Color`Highlighter" and click enter.

## QA Tools

### Doc​Blockr

[DocBlockr](https://sublime.wbond.net/packages/DocBlockr)

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `DocBlockr` and click enter.

#### Basic usage

Type `/**` or `/*` then enter

### PHP CS-Fixer

Requires `php-cs-fixer` to work.

[PHP CS-Fixer](https://sublime.wbond.net/packages/Phpcs)

The PHP Coding Standards Fixer tool fixes most issues in your code when you want to follow the PHP coding standards as defined in the PSR-1 and PSR-2 documents.
[CS-Fixer on Sensio-Labs](http://cs.sensiolabs.org)

#### Basic usage

Auto-correct files on save (<kbd>Ctrl</kbd> <kbd>S</kbd>), according to basic or user rules.



### Sublime Linter

[]()

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `SublimeLinter` and click enter.

### CSSLint

Requires `NodeJS` and `csslint` node package to work

[CSSLint](https://sublime.wbond.net/packages/SublimeLinter-csslint)

```
npm install -g csslint
```

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `CSSLint` and click enter.

#### Basic usage

Search for `CSSLint: Run CSSLint` from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X or use a keyboard shortcut (by default this is `Ctrl+Alt+C`).

Change this by adding something like the following to your key bindings:

```
{ "keys": ["ctrl+alt+c"], "command": "csslint" }
```

### JSLint

Requires `NodeJS` to work.

[JSLint](https://sublime.wbond.net/packages/JSLint)

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `JSLint` and click enter.

#### Basic usage

Make a multi-line selection, or multiple selections
Press <kbd>Ctrl</kbd> <kbd>Alt</kbd> <kbd>A</kbd> on Windows and Linux, or `Cmd+Ctrl+A` on OS X

### Less2Css

Requires `lessc` installed on `PATH`.

[Less2Css](https://sublime.wbond.net/packages/Less2Css)

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `Less2Css` and click enter.


### Git Gutter

[GitGutter](https://sublime.wbond.net/packages/GitGutter)

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `GitGutter` and click enter.


### Markdown Preview

[Markdown Preview](https://sublime.wbond.net/packages/Markdown%20Preview)

Provides markdown preview in browser.

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `LESS` and click enter.

#### Basic usage

WIP


### Monokai Extended

[Monokai-Extended](https://github.com/jisaacks/sublime-monokai-extended)

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `Monokai`Extended" and click enter.

### LESS

[LESS Highlighting](https://sublime.wbond.net/packages/LESS)

Provides syntax highlighting for .less files, along with snippets and completions.

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `LESS` and click enter.

### Theme

[](https://github.com/daylerees/colour-schemes)

Select "Install Package" from the Command Palette: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>P</kbd> on Windows and Linux or `⇧⌘P` on OS X
Search for `Dayly`Reese Colour Scheme" and click enter.


## Custom build systems

[](http://addyosmani.com/blog/custom-sublime-text-build-systems-for-popular-tools-and-languages/)


## Snippets

