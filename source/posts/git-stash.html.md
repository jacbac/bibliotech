---
title: Git stash
date: 2013-11-25 13:52
authors: JacBac
categories: git
tags: git, stash
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

---

http://sametmax.com/soyez-relax-faites-vous-un-petit-git-stash/
http://front-back.com/2012/05/vas-y-git-mets-du-stash

Lister les stash en cours

```
git stash list
```

Enregistrer le travail en cours dans un stash

```
git stash
```

Enregister le travail en cours dans un stash au nom particulier :

```
git stash save "mon super message"
```

Enregister en plus les fichiers non-trackés :

```
git stash -u
```
ou

```
git stash save -u "mon top message"
```

Revenir au dernier stash (le plus récent) :

```
git stash apply # garde le stash en mémoire
```
ou

```
git stash pop # ne garde pas le stash : le supprime de stash list
```

Revenir à un stash particulier (on connait son number grâce à git stash list)

```
git stash apply stash@{0}    [<name_stash@number>
```

Supprimer un stash en particulier (le n°2)

```
git stash drop stash@{2}
```

Supprimer toute la list de stash

```
git stash clear
```

Avoir plus d’info sur un stash (le n°3)

```
git stash show stash@{3}
```
