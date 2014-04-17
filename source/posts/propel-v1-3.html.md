---
title: Propel v1.3 enhanced
date: 2013-12-02 11:30
authors: JacBac
categories: propel
tags: propel 1.3, sql, orm
banner: /posts_uploads/2013/11/nick-nolte.jpg

"sources": [
  {
    "label": "Propel 1.3 Doc",
    "href": "http://trac.propelorm.org/wiki/Documentation/1.3",
    "lang": "EN"
  },
  {
    "label": "Propel 1.3 Doc - New & deprecated method",
    "href": "http://trac.propelorm.org/wiki/Documentation/1.3/Upgrading",
    "lang": "EN"
  },
  {
    "label": "Set distinct SQL with propel",
    "href": "http://stereointeractive.com/blog/2007/12/13/propel-set-distinct-setdistinct/",
    "lang": "EN"
  },
  {
    "label": "Custom SQL hacks",
    "href": "http://stereointeractive.com/blog/2007/06/12/propel-queries-using-custom-sql-peer-classes-and-criterion-objects/",
    "lang": "EN"
  }
]

layout: posts

---

Créer ou modifier un schema propel
----------------------------------

[La documentation officielle sur les schémas, c'est ici](http://trac.propelorm.org/wiki/Documentation/1.3/Schema)

[Et spécifiquement sur les types possibles des colonnes](http://trac.propelorm.org/wiki/Documentation/1.3/ColumnTypes)

Récupérer de la BDD un tableau de données
-----------------------------------------


Récupérer de la BDD un objet particulier
----------------------------------------

Pour cela on `hydrate` manuellement les données pour en faire des objets

```
$stmt = MarketingUserPeer::doSelectStmt($c);

$users = array();
while($row = $stmt->fetch(PDO::FETCH_NUM))
{
  $marketingUser = new MarketingUser();
  $marketingUser->hydrate($row);
  $users[] = $marketingUser;
}
return $users;
```

Set DISTINCT
------------

