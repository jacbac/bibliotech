---
title: Créer un nouveau repository git sur le serveur
date: 2013-11-25 10:16
authors: JacBac
categories: git, serveur
tags: git, serveur, sd-39300

layout: posts

---

## Online

On se connecte au serveur de projets git

    ssh git@sd-39300.dedibox.fr

For Easytoog v4 etc repos:

    cd repositories/v4

Note the ./v4 path

For other custom projects:

    cd repositories

Then:

    mkdir mon_projet.git
    cd mon_projet.git
    git --bare init
    git update-server-info
    vim config

add (change by "/repositories/v4/{mon_projet}.git" if it's a v4 project)

    [remote "origin"]
            fetch = +refs/heads/*:refs/remotes/origin/*
            url = git@sd-39300.dedibox.fr:~/repositories/{mon_projet}.git
    [branch "master"]
            remote = origin
            merge = refs/heads/master


## On local

    cd {test_repo}
    vim .git/config

add (change by "/repositories/v4/{mon_projet}.git" if it's a v4 project)

    [remote "origin"]
            fetch = +refs/heads/*:refs/remotes/origin/*
            url = git@sd-39300.dedibox.fr:~/repositories/{test_repo}.git
    [branch "master"]
            remote = origin
            merge = refs/heads/master
