use AI

db.books.find()

db.books.find({ tags: { $in: [ "electronics","smartphones"] } })
//A , B , D ,E 
db.books.find({ tags: { $all: ["electronics","smartphones"] } })
// B , E

//to return Contains two Values ONLY Without extra value
db.books.find({
    "tags": { "$all": ["electronics", "smartphones"], "$size": 2 }})
//B

db.books.find({tags:{$elemMatch:{$eq:"electronics",$eq:"smartphones"}}})
// Like $all B, E

db.books.find({ tags: { $in: [ "smartphones","electronics"] } })
//  Same
db.books.find({ tags: { $all: ["smartphones","electronics"] } })
// Same
db.books.find({tags:{$elemMatch:{$eq:"smartphones",$eq:"electronics"}}})
// Like in