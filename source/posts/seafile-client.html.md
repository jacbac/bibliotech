---
title: Seafile client
date: 2013-11-27 11:30
authors: JacBac
categories: linux
tags: debian, seafile
banner: /posts_uploads/2013/11/seafile-banner.png

layout: posts

---

[Seafile](http://seafile.com/) est un service de cloud partagé utilisé par mon employeur pour sauvegarder sa documentation projet. Seafile propose un client graphique permettant d'accéder et de synchroniser des dossiers distants/locaux très facilement.

Nous allons voir comment installer le client sur son poste local. Le reste de la configuration est très aisée : il suffit de posséder un accès authentifié auprès du compte (email et mot de passe) pour accéder ensuite aux dossiers partagés du cloud.

Pour l'instant, le serveur utilisé est `TODO`.

## Sous Debian

###Pré-requis

* libjansson4

```
sudo apt-get install libjansson4
```

###Install

Télécharger le client [linux seafile 2.x](http://seafile.com/en/download/)

	sudo dpkg -i seafile_2.0.8_amd64.deb

###Launch seafile

	seafile-applet

WIP Image du client posts_uploads/2013/11seafile-applet.png

## Sous Ubuntu

WIP


## Sous Mac OS

WIP
