---
title: Grunt made easy
date: 2014-04-25 20:30
authors: JacBac
categories: grunt
tags: debian, seafile
banner: /posts_uploads/2013/11/seafile-banner.png

layout: posts

---

## Install globally

```shell
npm install grunt-cli -g
```

## In a project

```
touch package.json && touch Gruntfile.js
```

In `package.json`, add

```json
{
    "name": "project-name",
    "version": "0.1.0",
    "description": "Project description",
    "author": "Your name",
    "license": "MIT",
    "main": "Gruntfile.js",
    "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
    },
    "keywords": [
        "keyword"
    ],
}
```

This is a basic template for your `package.json`.
You can find other options on [](https://www.npmjs.org/doc/json.html)

```shell
npm install grunt-contrib-copy grunt-processhtml grunt-uncss grunt-contrib-uglify grunt-contrib-imagemin grunt-contrib-watch --save-dev
```

## Help

Lists available tasks : `grunt --help`

## Packages

https://www.npmjs.org/package/grunt-contrib-imagemin
https://www.npmjs.org/package/grunt-autoprefixer : npm install grunt-autoprefixer --save-dev
https://www.npmjs.org/package/grunt-contrib-clean
https://www.npmjs.org/package/grunt-processhtml
