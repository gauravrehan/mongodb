# If we want to keep the schema of documents same then we should set the values as null like below. but here Mongo is not doing any validations.
use shop


db.products.insertOne({name: "A book", price: 12.99 })
db.products.insertOne({name: "A T-Shirt", price: null })

# Data types

Datatypes

Text
Boolean
Number
	Integer (int32)
	NumberLong (int64)
	NumberDecimal (most precise for scientific calcuations)
ObjectId
ISODate example ISODate("2019-09-09")
Timestamp

# Inspect database stats
use companyData

db.companies.insertOne({name: "Fresh Apples Inc", isStartup: true, employees: 33, funding: 12345678901234567890, details: {ceo: "Gaurav Rehan"}, tags: [{title: "super"}, {title: "perfect"}], foundingDate: new Date(), insertedAt: new Timestamp()})

db.stats()

# Drop all documents inside a collection
db.companies.drop()

# To view the type of an attribute
typeof db.numbers.findOne().a





