---
title: Git ignore
date: 2013-11-25 13:52
authors: JacBac
categories: git
tags: git, gitignore
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

"sources": [
  {
    "label": "Stackoverflow : gitignore-file-not-ignoring",
    "href": "http://stackoverflow.com/questions/1139762/gitignore-file-not-ignoring",
    "lang": "EN"
  },
  {
    "label": "GitHub Help : ignoring files",
    "href": "https://help.github.com/articles/ignoring-files",
    "lang": "EN"
  }
]

---

If you are trying to ignore changes to a file that's already tracked in the repository (e.g. a dev.properties file that you would need to change for your local environment but you would never want to check in these changes) than what you want to do is:

```
git update-index --assume-unchanged <file>
```

If you wanna start tracking changes again

```
git update-index --no-assume-unchanged <file>
```

You can use

```
git ls-files -v
```

If the character printed is lower-case, the file is marked assume-unchanged (git-scm.com/docs/git-ls-files)
