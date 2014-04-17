---
title: Convert line endings
date: 2013-11-27 12:52
authors: JacBac
categories: linux
tags: eof, line endings, dos2unix
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

---

##Pré-réquis

* dos2unix

```
sudo apt-get install dos2unix
```

##Commande

```
find VOTRE_REPERTOIRE -type f -exec dos2unix {} \;
```

ou une autre manière, dans votre repertoire

```
find . -type f -exec dos2unix -k -s -o {} ';'
```
