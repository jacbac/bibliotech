---
title: Personnalisation de git et de son rendu terminal avec .gitconfig
date: 2013-11-29 09:02
authors: JacBac
categories: dot-file, git
tags: dot-file, bash, alias, terminal, git
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

---

Inspiration
-----------

```
[user]
    name = {USER}
    email = {EMAIL}@{PROVIDER.COM}

[core]
    autocrlf = input
    safecrlf = true
    filemode = true

[alias]
    st = status
    df = diff
    co = checkout
    ci = commit
    br = branch
    oneline = log --pretty=oneline --abbrev-commit --graph --decorate
    lc = !git oneline ORIG_HEAD.. --stat --no-merges
    hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
    type = cat-file -t
    dump = cat-file -p

[color]
    diff = auto
    ui = auto
    status = auto
    branch = auto
    interactive = auto

[color "branch"]
    current = yellow reverse
    local = yellow
    remote = green

[color "status"]
    changed = red
    added = green
    untracked = blue

[color "diff"]
    meta = yellow bold
    frag = magenta bold
    old  = red bold
    new  = green bold
```
