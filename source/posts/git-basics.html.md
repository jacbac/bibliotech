---
title: Git basics
date: 2013-11-26 10:00
authors: JacBac
categories: git
tags: git
banner: /posts_uploads/2013/11/acm.jpg

"sources": [
  {
    "label": "Git Immersion",
    "href": "http://gitimmersion.com",
    "lang": "EN"
  },
  {
    "label": "Git guide",
    "href": "http://rogerdudler.github.com/git-guide/",
    "lang": "EN"
  },
  {
    "label": "Aide mémoire git",
    "href": "http://www.kitpages.fr/fr/cms/59/aide-memoire-git",
    "lang": "FR"
  },
  {
    "label": "Git branching model",
    "href": "http://nvie.com/posts/a-successful-git-branching-model/",
    "lang": "EN"
  },
  {
    "label": "Git ready",
    "href": "http://fr.gitready.com/",
    "lang": "FR"
  }
]

layout: posts

---

### Créer un nouveau dépôt

    mkdir mon_projet
    cd mon_projet
    git init

### Cloner un dépôt

créez une copie de votre dépôt local en exécutant la commande

    git clone /path/to/repository

si vous utilisez un serveur distant, cette commande sera

    git clone username@host:/path/to/repository

Pour cloner un dépôt dans un dossier spécifique (hello) :

    git clone hello cloned_hello

créera un dossier cloned_hello à partir du dépôt hello (en local ou pas en local, à adapter)

## Lister les branches

### Lister les branches locales

    git branch

### Lister toutes les branches (locales ET remote)

    git branch -a

## Versionner des fichiers

### Ajouter un fichier à l’index

    git add <filename>


Ajouter tous les fichiers en attente (untracked, staged)

    git add -A
    git add -u

    git add .   # add to index only files created or modified and not those deleted 
    git add -u  # add to index only files modified or deleted and not those created 
    git add -A  # do both operation at once, add to index all files 

Ajouter un fichier au HEAD (valide les changements)

    git commit -m "Message de validation"


## Envoyer des changements

### A la branche master origin

    git push origin master

## Se déplacer entre les éléments

### vers une branche (master)

    git checkout master

### vers un tag (v1)

    git checkout v1

## Tagger une version

    git tag v1
    git tag v1^   # tag une version antérieur

## Etudier les différences : git diff

Retrouvez les modifications faites depuis le dernier commit avec
    git diff
Ou depuis hier :
    git diff "@{yesterday}"
Ou entre une version spécifique et la version deux commits en arrière :
    git diff 1b6d "master~2"
Dans chacun de ces cas, la sortie est un patch (rustine) qui peut être appliqué en utilisantgit apply. Vous pouvez aussi essayer :
    git whatchanged --since="2 weeks ago"

Souvent je parcours plutôt l’historique avec qgit, pour sa pimpante interface photogénique, outig, une interface en mode texte qui fonctionne même sur les connexions lentes. Autrement, installez un serveur web, lancez git instaweb et dégainez n’importe quel navigateur internet.

### Outils Git Diff

* [gitk]()
* [gitg]()
* [qgit]()

Créer une clef rsa pour git

Les clefs ssh publiques des développeurs sont déjà dans le fichier /home/git/.ssh/authorized_keys:.



