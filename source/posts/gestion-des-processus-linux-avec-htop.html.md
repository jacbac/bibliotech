---
title: Gestion des processus linux avec htop
date: 2013-11-26 10:53
authors: JacBac
categories: linux
tags: linux, ps, kill
banner: /posts_uploads/2013/11/acm.jpg

"sources": [
  {
    "label": "Manage processes in linux",
    "href": "https://www.digitalocean.com/community/articles/how-to-use-ps-kill-and-nice-to-manage-processes-in-linux",
    "lang": "EN"
  }
]

layout: posts

---

## Gestion des processus

Normalement, pour suivre les processus en cours, on utilise la commande

	top

et bien d'autres lignes de commande évolué.

Bien pratique, mais peut mieux faire par exemple avec le logiciel `htop` qui utilise le terminal en fonction graphique

![Un screenshot rapide d'htop](/posts_uploads/2013/11/htop-console.png "Screenshot htop")

	sudo apt-get install htop

yapluka :

	htop

On peut ensuite utiliser les touches `F1` à `F10` pour manipuler les différents processus, les trier, les tuer, etc.

Pour les grands débutants comme moi, qui ne sont pas passionés pas les processus systèmes et autres PID,

merci `htop` !
