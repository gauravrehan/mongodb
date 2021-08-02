# db.collection.insert()
Insert inserts the single or array of objects just like insert or insertMany. but it doesn't return the objectid created. we have to make a second call to get the object id.

# Ordered Inserts
by default when we are inserting documents via insertMany, the objects are inserted in sequence (order) if any failure happens then the documents after the errored out objects are not inserted. this is default behavior. 
IF we want to disable this feature we can pass option "ordered" : false (default is true). if error happens the objects after the errored out object will get inserted.
```
db.collection.insertMany ([{},{},{}], {ordered: false})
```
# WriteConcern

default: {w: 1, wtimeout: 200, j: undefined}

w: how many mongodb instances should acknowledge the successful insert. default is 1.
wtimeout: self explainatory
j: whether to write the insert in journal file first. Journal file is a kind of TODO file. if the server goes down, the write can be executed if it is present in journal. Default is no journal. we can set journal to true. if we want to journal the writes. Writes takes longer if journal is true.

```
db.collection.insertMany ([{},{},{}], {writeConcern: {w: 1, wtimeout:200, j: true}})
```

# Atomicity

Document is saved as a whole or failed as a whole (including embedded documents)

# Importing a large dataset

exit mongosh
mongoimport tv-shows.json -d movieDatabase -c moviesCollection --jsonArray --drop [drops existing collection if it exists)


