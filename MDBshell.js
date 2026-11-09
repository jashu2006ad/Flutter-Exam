// Select database
use mydb

// Create collection
db.createCollection("products")

// Insert a document
db.products.insertOne({
    name: "Laptop",
    price: 50000
})

// Display documents
db.products.find()

// Drop collection
db.products.drop()

// Drop database
db.dropDatabase()
