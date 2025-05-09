db.Staff.insertOne({
  "_id": 1,
  "name": "Moataz",
  "age": 26,
  "gender": "male",
  "department": "BI"
})

db.Staff.insertMany([
  {
    _id: 2,
    name: "Ahmed",
    age: 20,
    gender: "male",
    department: "AI"
  },
  {
    _id: 3,
    name: "Marwa",
    age: 25,
    gender: "female",
    managerName: "Eng. Mohamed",
    department: "DB"
  },
  {
    _id: 4,
    name: "Omar",
    age: 15,
    gender: "male",
    DOB: "2010-01-01"
  }
])

//1. find all documents
db.Staff.find() 

//2
db.Staff.find({ gender: "male" })

//3. between 20 & 25
db.Staff.find({ 
    age: {$gte: 20, $lte: 25 } 
})

//4. Age is 20 or gender is female
db.Staff.find({ age: 25, gender: "female" })

//5. Age is 20 or gender is "female
db.Staff.find({ $or: [{ age: 20 }, { gender: "female" }] })

//Update One
db.Staff.updateOne(
  { age: 15 },
  { $set: { name: "Ammar" }}
)

//Update Many
db.Staff.updateMany(
  {},
  { $set: { department: "AI" } }
)
// New Collection test
db.createCollection("test")
db.test.insertOne({
  "_id": 1,
  "name": "Moataz",
  "age": 26,
  "gender": "male",
  "department": "BI"
})
// Delete 
db.test.deleteOne({age: 15})
=
//Delete all male
db.Staff.deleteMany({gender: "male"})

//delete all docs
db.test.deleteMany({}) 








