#login
```
mongosh -u mongo -p mongo
```

#list databases
```
show dbs
```

#switch database
```
use flights
```
#CRUD Operations

#CREATE
```
insertOne(data, options)
insertMany(data, options)

```

## Examples
```
db.flightData.insertMany([
  {
    "departureAirport": "MUC",
    "arrivalAirport": "SFO",
    "aircraft": "Airbus A380",
    "distance": 12000,
    "intercontinental": true
  },
  {
    "departureAirport": "LHR",
    "arrivalAirport": "TXL",
    "aircraft": "Airbus A320",
    "distance": 950,
    "intercontinental": false
  }
])

db.passengers.insertMany([
  {
    "name": "Max Schwarzmueller",
    "age": 29
  },
  {
    "name": "Manu Lorenz",
    "age": 30
  },
  {
    "name": "Chris Hayton",
    "age": 35
  },
  {
    "name": "Sandeep Kumar",
    "age": 28
  },
  {
    "name": "Maria Jones",
    "age": 30
  },
  {
    "name": "Alexandra Maier",
    "age": 27
  },
  {
    "name": "Dr. Phil Evans",
    "age": 47
  },
  {
    "name": "Sandra Brugge",
    "age": 33
  },
  {
    "name": "Elisabeth Mayr",
    "age": 29
  },
  {
    "name": "Frank Cube",
    "age": 41
  },
  {
    "name": "Karandeep Alun",
    "age": 48
  },
  {
    "name": "Michaela Drayer",
    "age": 39
  },
  {
    "name": "Bernd Hoftstadt",
    "age": 22
  },
  {
    "name": "Scott Tolib",
    "age": 44
  },
  {
    "name": "Freddy Melver",
    "age": 41
  },
  {
    "name": "Alexis Bohed",
    "age": 35
  },
  {
    "name": "Melanie Palace",
    "age": 27
  },
  {
    "name": "Armin Glutch",
    "age": 35
  },
  {
    "name": "Klaus Arber",
    "age": 53
  },
  {
    "name": "Albert Twostone",
    "age": 68
  },
  {
    "name": "Gordon Black",
    "age": 38
  }
])
```
* with udpate or updateMany we should use $set to set the attributes. If we don't use set then update and updateMany will throw error.
* update works more or less like updateMany but it allows updates without $set. in which case it completely replaces the original document with passed document. Hence to avoid confusion, try to use replaceOne

#UPDATE
```
updateOne(filter, data, options)
updateMany(filter, data, options)
updateMany(filter, data, options)
replaceOne(filter, data, options)
```
##Examples
* $set sets the marker attribute's value to delete or update it in the document if it already exists.
* {} filter matches all documents
```
db.flightData.updateOne({distance: 12000}, {$set: marker: "delete"}})

db.flightData.updateOne({}, {$set: marker: "delete"}})

db.flightData.update({_id: XXXXX}, {delayed: true})

db.flightData.replaceOne({_id: XXXX}, {pass full document})
```

#READ
* find returns a cursor. returns top 20. type it to get next data.
* findOne doesn't return a cursor. it directly returns a document.
* we cannot use pretty on findOne becuase findOne doesn't return a cursor. we can use pretty only with find().
* if we want to get all data in find call then use toArray().
* we can use forEach and call some methods made available by the driver, i.e. printjson.
* projection: to get only select fields in response pass {name : 1} in options for example to return only name field. use _id: 0 to exclude ids. 
```
find(filter, options)
findOne(filter, options)


```

## Examples
```
db.flightData.find({intercontinental: true}).pretty()
db.flightData.find({distance: {$gt: 10000}}).pretty()
db.flightData.findOne({distance: {$gt: 900}}).pretty()


db.passengers.find().toArray()

db.passengers.find().forEach((passengerData) => {printjson(passengerData)})

db.passengers.find({}, {name: 1}).pretty()
db.passengers.find({}, {name: 1, _id: 0}).pretty()
```

#DELETE
```
deleteOne(filter, options)
deleteMany(filter, options)
```
##Examples
```
db.flightData.deleteOne({departureAirport: "TXL"})
db.fightData.deleteOne({_id:XXXX}
```

# Embedded documents

* we can have up to 100 levels of Nesting
* we can have a maximum of 16mb sized document

## Example
* here I am adding an embedded document
```
db.flightData.updateMany({}, {$set: {"status" : {"description": "on-time", "lastUpdated": "1 hour ago", "details": {"responsible": "Gaurav Rehan"}}}})
```

# Embedded Arrays
* we can embed arrays as well

## Example

* Here in below example we are adding strings, but we can add documents in the array as well
```
db.passengers.updateMany({"name": "Albert Twostone"}, {$set : {"hobbies": ["sports", "cooking"]}})
```

# Accessing structured data
* get hobbies of a person
```
db.passengers.findOne({name: "Albert Twostone"}).hobbies
```
* get persons with hobbies as sports
```
db.passengers.find({hobbies: "sports"}).pretty()
```
* print name of the first person having hobby as sports
```
db.passengers.findOne({hobbies: "sports"}).name
```
* filter on nested data
```
db.flightData.find({"status.description" : "on-time"}).pretty()
db.flightData.find({"status.details.responsible" : "Gaurav Rehan"}).pretty()
```

# Drop database
```
use testdb
db.dropDatabase()

```
