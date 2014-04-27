---
title: Message d'obsolescence des navigateurs
date: 2013-11-29 12:00
authors: JacBac
categories: frontend, ie
tags: navigateur, IE8, ux
banner: /posts_uploads/2013/11/acm.jpg

"sources": [
  {
    "label": "Alsacreations - Commentaires conditionnels pour navigateurs IE",
    "href": "http://www.alsacreations.com/astuce/lire/48-commentaires-conditionnels.html",
    "lang": "FR"
  }
]

layout: posts

---

Cibler les navigateurs
----------------------

### Avec des commentaires conditionnels

```html
<!--[if gte IE 6]> pour IE 6.0 et version plus récentes <![endif]-->

<!--[if IE 5.0]> pour IE 5.0 <![endif]-->

<!--[if IE 5.5000]> pour IE 5.5 <![endif]-->

<!--[if IE 6]> pour IE 6.0 <![endif]-->

<!--[if IE 7]> pour IE 7.0 <![endif]-->

<!--[if IE 8]> pour IE 8.0 <![endif]-->

<!--[if IE 9]> pour IE 9.0 <![endif]-->

<!--[if gte IE 7]> pour IE 7 et supérieur <![endif]-->

<!--[if lt IE 7]> pour IE inférieur à IE 7 <![endif]-->

<!--[if lte IE 6]> pour IE 5.0, IE 5.5 et IE 6.0 mais pas IE7.0 et plus <![endif]-->

<!--[if (lt IE 6)|(IE 8)]> pour IE inférieur à IE 6.0 ou si IE 8 <![endif]-->

<!--[if (gt IE 5)&(lt IE 7)]> pour IE supérieur à IE 5.0 et inférieur à IE 7 <![endif]-->

<!--[if !IE]><!--> si ce n'est pas IE <!--<![endif]-->
```

### Avec Javascript et Jquery

* [Jquery browser](http://api.jquery.com/jQuery.browser/)
* [Browser version Firefox/Gecko](http://en.wikipedia.org/wiki/Gecko_(layout_engine))


```js
<script type="text/javascript">
  function is_supported_browser()
  {
     var userAgent = navigator.userAgent.toLowerCase();

     // Is this a version of IE?
     if($.browser.msie)
     {
        userAgent = $.browser.version;
        version = userAgent.substring(0,userAgent.indexOf('.'));
        if ( version < 8 ) return true;
     }

     // Is this a version of Chrome?
     $.browser.chrome = /chrome/.test(navigator.userAgent.toLowerCase());
     if($.browser.chrome)
     {
        userAgent = userAgent.substring(userAgent.indexOf('chrome/') +7);
        version = userAgent.substring(0,userAgent.indexOf('.'));
        if (version >= 13) return true;
     }

     // Is this a version of Safari?
     if($.browser.safari)
     {
        userAgent = userAgent.substring(userAgent.indexOf('version/') +8);
        version = userAgent.substring(0,userAgent.indexOf('.'));
        if (version >= 5) return true;
     }

     // Is this a version of firefox?
     if($.browser.mozilla && navigator.userAgent.toLowerCase().indexOf('firefox') != -1)
     {
        userAgent = userAgent.substring(userAgent.indexOf('firefox/') +8);
        version = userAgent.substring(0,userAgent.indexOf('.'));
        if (version <= '3.6') return true;
     }
     return false;
  }
</script>
```

**Exemple d'implantation d'une reconnaissance par JS**

On garde en complément les commentaires conditionnels pour IE < 8 dans le cas où le navigateur ne prend pas en charge JS.

```js
<script type="text/javascript">
  var obsolet = '<div style="text-align:center; clear:both; position:relative;"><div style="width:720px; border:1px solid #f0f0f0; background:#f0f0f0; margin:0 auto; padding:0 10px 0 10px; overflow:hidden;"><div style="width: 80px; float: left;"><img src="images/browsers/warn_75.png" alt="Warning!"/></div><div style="width:300px; float:left; font-family:\'Lucida Grande\', \'Lucida Sans Unicode\', Arial, sans-serif; padding:4px;"><div style="font-size: 14px; font-weight: bold; margin-top: 12px; color: #c00;">Vous utilisez un navigateur obsolète.</div><div style="font-size: 12px; margin-top: 2px; line-height: 16px; color: #666;">Afin d\'optimiser votre visite sur ce site,<br /> merci de mettre à jour votre Navigateur Internet.</div></div><div style="margin-top: 6px;"><div style="width: 64px; float: left;"><a href="http://www.google.com/chrome" target="_blank"><img src="images/browsers/64-chrome.png" style="border: none;" alt="Télécharger Google Chrome"/></a></div><div style="width: 64px; float: left;"><a href="http://www.firefox.com" target="_blank"><img src="images/browsers/64-firefox.png" style="border: none;" alt="Télécharger Firefox"/></a></div><div style="width: 64px; float: left;"><a href="http://www.apple.com/safari/download/" target="_blank"><img src="images/browsers/64-safari.png" style="border: none;" alt="Télécharger Safari"/></a></div><div style="width: 60px; float: left;"><a href="http://www.opera.com/download" target="_blank"><img src="images/browsers/64-opera.png" style="border: none;" alt="Télécharger Opera"/></a></div><div style="width: 50px; float: left;"><a href="http://windows.microsoft.com/fr-fr/internet-explorer/ie-10-worldwide-languages" target="_blank"><img src="images/browsers/64-ie.png" style="border: none;" alt="Télécharger Internet explorer"/></a></div></div></div></div>';

  var userAgent = navigator.userAgent.toLowerCase();

  if($.browser.mozilla && navigator.userAgent.toLowerCase().indexOf('firefox') != -1)
  {
    userAgent = userAgent.substring(userAgent.indexOf('firefox/') +8);
    version = userAgent.substring(0,userAgent.indexOf('.'));
    if (version <= '3.6')
      $(obsolet).prependTo(document.body);
  }
</script>
```

Où l'insérer
------------

1. Globalement dans le fichier layout.php, en fin de <head> ou au tout début du <body>
2. Ou sur tous les templates en tête de fichier si il n'y a pas de layout.

Quoi insérer
------------

### Message Browse Happy en français

```html
<!--[if lt IE 9]>
  <p class="chromeframe">Vous utilisez un <strong>navigateur obsolète</strong>. Il peut rendre ce site non optimisé. Merci <a href="http://http://http://browsehappy.com/?locale=fr">de mettre à jour votre navigateur</a> ou d <a href="http://www.google.com/chromeframe/?redirect=true">activer Google Chrome Frame</a> pour améliorer votre navigation.</p>
<![endif]-->
```

### Message Browse Happy en anglais

```html
<!--[if lt IE 9]>
  <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
```

### Message avec images navigateurs intégrées

1. Vérifier les liens vers les pages de téléchargement !
2. Ne pas oublier d'ajouter au projet le fichier de logos navigateurs !

Ex. copiable à partir de :

    sauter_v3/web/images/browsers

Eventuellement, adapter le très beau css ci-dessous

TODO:

1. Revoir les font
2. Mettre des `<ul><li>` et des `<span>` à la place des `<div>`
3. Revoir le CSS global (inline img plutot que float) ;)
 
```html
<!--[if lt IE 9]>
  <div style="text-align:center; clear:both; position:relative">
    <div style="width:720px; border:1px solid #f0f0f0; background:#f0f0f0; margin:0 auto; padding:0 10px 0 10px; overflow:hidden;">
      <div style="width: 80px; float: left;">
        <img src="images/browsers/warn_75.png" alt="Warning!"/>
      </div>
      <div style="width:300px; float:left; font-family:'Lucida Grande', 'Lucida Sans Unicode', Arial, sans-serif; padding:4px;">
        <div style="font-size: 14px; font-weight: bold; margin-top: 12px; color: #c00;">Vous utilisez un navigateur obsolète.</div>
        <div style="font-size: 12px; margin-top: 2px; line-height: 16px; color: #666;">Afin d'optimiser votre visite sur ce site,<br /> merci de mettre à jour votre Navigateur Internet.</div>
      </div>
      <div style="margin-top: 6px;">
        <div style="width: 64px; float: left;"><a href="http://www.google.com/chrome" target="_blank"><img src="images/browsers/64-chrome.png" style="border: none;" alt="Télécharger Google Chrome"/></a></div>
        <div style="width: 64px; float: left;"><a href="http://www.firefox.com" target="_blank"><img src="images/browsers/64-firefox.png" style="border: none;" alt="Télécharger Firefox"/></a></div>
        <div style="width: 64px; float: left;"><a href="http://www.apple.com/safari/download/" target="_blank"><img src="images/browsers/64-safari.png" style="border: none;" alt="Télécharger Safari"/></a></div>
        <div style="width: 60px; float: left;"><a href="http://www.opera.com/download" target="_blank"><img src="images/browsers/64-opera.png" style="border: none;" alt="Télécharger Opera"/></a></div>
        <div style="width: 50px; float: left;"><a href="http://windows.microsoft.com/fr-fr/internet-explorer/ie-10-worldwide-languages" target="_blank"><img src="images/browsers/64-ie.png" style="border: none;" alt="Télécharger Internet explorer"/></a></div>
      </div>
    </div>
  </div>
<![endif]-->
```
