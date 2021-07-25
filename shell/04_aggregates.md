# Aggregates

use authors
db.authorData.insertMany([{name: "Gaurav Rehan"},{name: "Aarav Rehan"}])

'0': ObjectId("60fbb7890d2b835408c38318"),
    '1': ObjectId("60fbb7890d2b835408c38319")


use books
db.booksData.drop()
db.booksData.insertOne({name: "A Text Book", authors: [ ObjectId("60fbb7890d2b835408c38318"), ObjectId("60fbb7890d2b835408c38319") ] })

#Lookup authors data while queries data for books

db.booksData.aggregate([{$lookup: {from: "authorData", localField: "authors", foreignField: "_id", as: "creators"}}]).pretty()
