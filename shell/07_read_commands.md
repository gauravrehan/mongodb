# read options
#Query & Projection operators
## Query selectors
Comparision, Evaluation, Logical, Array, Element, Comments, Geospatial

### Comparison operators

get first document (no cursor)
db.movies.findOne({age: 30})

db.movies.find({name: "The Last Ship"})

db.moves.find({runtime: {$eq: 60}})

db.moves.find({runtime: {$ne: 60}})

db.moves.find({runtime: {$gt: 60}})

db.moves.find({runtime: {$lt: 60}})

db.moves.find({"rating.average": {$lt: 60}})

db.movies.find({genres: "Drama"}) -- to match Drama in list of genres

db.movies.find({genres: ["Drama"]}) -- to match documents that have just one genre and that is Drama.

db.movies.find({runtime: { $in: [30, 42]}}).pretty() -- find documents that have runtime as 30 or 42

db.movies.find({runtime: { $nin: [30, 42]}}).pretty() -- find documents that have runtime as not 30 or 42

db.moves.find({"rating.average": {$lt: 60}}).count()

### Logical Operators

of format: db.moves.find({$or: [{},{},...]})

db.moves.find({$or: [{runtime: {$lt: 5}},{runtime: {$gt: 3}}]})



similarly there are gte and lte.



## Projection Operators
$ , $elemMatch , $meta, $slice


#Query Selectors
#Projection Operators

