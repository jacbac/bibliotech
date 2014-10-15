Bibliotech
==========

A static site for non-static documentation !

[Demo](http://jacbac.github.io/bibliotech/)

## Disclaimer :

This is a attempt to try a "markdown blogging" system (Middleman) which derivated in building a "partial" documentation repository for myself and/or a small dev team.

In some way it's a fork of Middleman. In a minor way.

The .md files located in `source/posts/` are at this point simple compilations of facts I found on internet. Just take a look or forget about it, it's not the point here.

`Always listen the Log Lady !`


## Usage

Use it as a blogging system.

Affichage sous format blog (et archivage) de tutoriaux, astuces, bonnes pratiques et autres ressources à propos des développements informatiques.

## Install

Installation process complete on 2014-04-16, Ubuntu 13.10 and Debian 7.2, localhost.

I have NOT deployed this project in a true prod environment (remote server), so try at your risk...
You can watch out a [demo on github.io](http://jacbac.github.io/bibliotech/).

### Required

* a Ruby version >= 1.9.3 (1.9.3 with ruby1.9.1dev package)
* gem
* gem bundler


#### Get Ruby With Rbenv

[Rbenv official](https://github.com/sstephenson/rbenv)

(If ZSH is already installed, change the following end of lines with `~/.bashrc` by `~/.zshrc`)

```shell
sudo apt-get install -y libssl-dev zlib1g-dev libreadline-dev

git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
```

Then you can list, search, get the ruby version you want and define a specific ruby version as a global version

```shell
rbenv install --list

rbenv install 2.1.1
rbenv global 2.1.1
ruby -v

rbenv rehash
```

The last step is to tell Rubygems not to install the documentation for each package locally

```shell
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
```

### Get Ruby with Ubuntu/Debian package

This is a stable but already outdated version of Ruby

```shell
sudo apt-get install ruby1.9.1 ruby1.9.1-dev

ruby -v
=> ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]
```

## Bibliotech

Puis on installe les dépendances du projet bibliotech

```shell
cd ~/my_workspace/bibliotech
[sudo] gem update
[sudo] gem install bundler
bundle install
```

Une fois que les différents composants ont été rapatriés, on lance une session de développement locale :

```
cd ~/my_workspace/bibliotech
bundle exec middleman
```

Le projet est maintenant accessible via l'adresse indiquée dans le terminal !

When your code (aka mostly posts) is ready for deployment, il devient nécessaire de `construire` le site. Do :

```
cd workspace/bibliotech
bundle exec middleman build
```

Compiled files go to the `build/` directory.

### Use Sublime-Text to push and publish your post on remote server

WIP Just an idea

Automated build and publish system with Sublime-Text Build ?

* [Link 1](http://matthewpalmer.net/blog/2014/01/18/publish-jekyll-posts-from-sublime-text-2/)
* [Link 2](http://www.devwithimagination.com/2014/03/16/sublime-text-3-build-systems/)


## TODO

* Complete search and templating
* Breadcrumb inactiv
* General CSS / graphism
* Fix bootstrap affix on scroll


## Documentation

WIP

### General ressources

[Middleman](http://middlemanapp.com/)

### Project specific ressources

#### Create a new post and add some metadatas

Simply create a new `your-name.html.md` file in `source/posts/`.
Then add some metadatas between 2 lines of `---`.

```markdown
---
title: Hello world
date: 2001-01-01 21:12

authors: Foo du Bar
categories: hello
tags: example, test, bibliotech
banner: /posts_uploads/2013/11/foo-du-bar.jpg

"sources": [
  {
    "label": "I am the label n°1",
    "href": "http://www.nyan.cat/",
    "lang": "EN"
  },
  {
    "label": "Et voilà !",
    "href": "http://www.estcequonmetenprodaujourdhui.info/",
    "lang": "FR"
  },
  {
    "label": "Yeah common' ! Dance with me in the snow",
    "href": "http://www.youtube.com/watch?v=-ecg5_Y08KI",
    "lang": "FR"
  }
]

layout: posts

---

Lorem ipsum inc.

```

Only `title`, `date` and `layouts` metas are mandatory, others are optionnals.

|Meta    |Usage                                        |
|--------|---------------------------------------------|
| title  | eq. to html tag h1 use in view list and post|
| date   | date use in view list and post              |
| layouts| specific template to use (see layouts dir)  |

#### Search

Lors de la compilation, on crée un fichier contenant divers mots-clefs parsé dans les posts. C'est ce fichier qui sert d'index pour la recherche.

A perfectionner...


## Credits

Based on [Middleman](http://middlemanapp.com/)
Bibliotech inspired by open source code of [LeonB](https://github.com/LeonB/blog.vanutsteen.nl)


## Licence

Copyright © 2013-2014 Jacques Bachelier & Philippe Chabert

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

