---
title: MongoDB Help
date: 2013-11-25 13:52
authors: JacBac
categories: mongoDB
tags: mongoDB, service, export, import, dump
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

"sources": [
  {
    "label": "MongoDB official docs : about mongoexport against mongodump",
    "href": "http://docs.mongodb.org/manual/reference/program/mongoexport/",
    "lang": "EN"
  }
]

---

Install MongoDB
---------------

See `posts/post-install-distrib-ubuntu` or `posts/post-install-distrib-debian`


Run MongoDB
-----------

The MongoDB instance stores its data files in the `/var/lib/mongo` and its log files in `/var/log/mongo`, and run using the mongod user account. If you change the user that runs the MongoDB process, you must modify the access control rights to the `/var/lib/mongo` and `/var/log/mongo` directories.

### Start MongoDB

```
sudo /etc/init.d/mongodb start
```

You can verify that mongod has started successfully by checking the contents of the log file at `/var/log/mongodb/mongodb.log`.

### Stop MongoDB

```
sudo /etc/init.d/mongodb stop
```

### Restart MongoDB

```
sudo /etc/init.d/mongodb restart
```

Restore & Import
----------------

For full fidelity, please use `mongodump` (see link in sources)

### Dumping / restoring

Example with bart project

```
mongodump --db bart
```

Exports dumped data as .bson in ./dump/bart/ :

```
dump/
└── bart
    ├── data.bson
    ├── file.bson
    ├── gamme.bson
    ├── produit.bson
    ├── system.indexes.bson
    └── website.bson
```

### Restoring a database using dumps

```
mongorestore --verbose --drop --db bart dump/bart/
```

### To restore an imported dump

```
mongorestore --verbose --drop  dump/bart/
```
