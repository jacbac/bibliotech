Bibliotech
==========

A static site for non-static documentation !

## Usage

Affichage sous format blog (et archivage) de tutoriaux, astuces, bonnes pratiques et autres ressources à propos des développements informatiques.

## Installation

L'installation a été testé OK le 16 avril 2014 sur un poste local avec Ubuntu 13.10 installé.

Aucun déploiement en conditions réelles n'a encoré été testé. Les sessions lancées de `bibliotech` ne l'ont été qu'en local avec `bundle exec`.

La procédure de déploiement et de mise à jour sur remote server n'est donc pas encore documentée.

### Pré-requis

* Ruby 1.8.x : KO
* Ruby 1.9.3 : OK (avec ruby1.9.1dev installé)
* Ruby 2.1.1 : OK
* gem bundler

Il peut arriver que vous ayez un conflit si ruby1.8 est déjà installé sur votre machine. Vous pouvez essayer de régler le conflit qui surviendra, ou alors vous pouvez faire "simple" :) et supprimer votre installation de ruby1.8 (puis la réinstaller en passant par des gestionnaires de version ruby plus souple comme Rbenv).

Installation dépréciée après des tests OK sur ruby 2.1.1 :

```
sudo apt-get install ruby1.9.1 ruby1.9.1-dev
(package ruby1.9.1 mal nommé => télécharge la dernière version en 1.9.3)

ruby -v
=> ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux] (ou équivalent)
```

La nouvelle méthode avec Rbenv est maintenant à préférer :

#### With Rbenv

[Rbenv official](https://github.com/sstephenson/rbenv)

If ZSH is already installed, change the following end of lines with `~/.bashrc` by `~/.zshrc`.

```
sudo apt-get install -y libssl-dev zlib1g-dev libreadline-dev

git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
```

Then you can list, search, get the ruby version you want and define a specific version as global

```
rbenv install --list

rbenv install 2.1.1
rbenv global 2.1.1
ruby -v

rbenv rehash
```

The last step is to tell Rubygems not to install the documentation for each package locally

```
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
```

#### Le projet

Puis on installe les dépendances du projet bibliotech

```
cd workspace/bibliotech
[sudo] gem update
[sudo] gem install bundler
bundle install
```

Une fois que les différents composants ont été rapatriés, on lance une session locale :

```
bundle exec middleman
```

Le projet est maintenant accessible via l'adresse indiquée dans le terminal !

## TODO

* Recherche pour l'instant active, mais incomplète
* Breadcrumb pour l'instant inactif
* CSS / graphisme général en beta
* Fix bootstrap affix on scroll

## Documentation

WIP

### Ressources générales

[Middleman](http://middlemanapp.com/)

### Ressources spécifiques

#### Composant de recherche

Lors de la compilation, on crée un fichier contenant divers mots-clefs parsé dans les posts. C'est ce fichier qui sert d'index pour la recherche.

A perfectionner...

#### Ajouter un nouveau fichier/article

Pour l'instant, on pose les fichiers en ".html.md" dans le dossier posts/

Y'a un système simple de layouts, assets, etc.

Ajouter des metadonnées à un fichier md, c'est simple (seuls 'title' et 'date' sont obligatoires) :

```markdown

---
title: Example Article
date: 2012-01-01

authors: Foo du Bar
categories: example, linux
tags: example, lorem, test
banner: /posts_uploads/2013/11/foo-du-bar.jpg

"sources": [
  {
    "label": "Je suis le label 1",
    "href": "http://www.nyan.cat/",
    "lang": "EN"
  },
  {
    "label": "Et voici mon pote le label 2",
    "href": "http://www.estcequonmetenprodaujourdhui.info/",
    "lang": "FR"
  },
  {
    "label": "Le 3 ok tu peux venir aussi",
    "href": "http://www.youtube.com/watch?v=-ecg5_Y08KI",
    "lang": "FR"
  }
]

layout: posts

---

```

Pour l'instant, seul les metas `title`, `date` et `layouts` sont obligatoires.

## Credits

Based on [Middleman](http://middlemanapp.com/)
Bibliotech inspired by open source code of [LeonB](https://github.com/LeonB/blog.vanutsteen.nl)

## Licence

Copyright © 2013-2014 Jacques Bachelier & Philippe Chabert

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

