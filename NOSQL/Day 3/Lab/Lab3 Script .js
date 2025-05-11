//1. Provide the MongoDB code for enforcing JSON schema validation when creating a collection named "employees" with required fields "name," "age" (min. 18), and "department" (limited to ["HR," "Engineering," "Finance"]). 
db.createCollection("employees", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["name", "age", "department"],
      properties: {
        name: {
          bsonType: "string",
          description: "name must be string"
        },
        age: {
          bsonType: "int",
          minimum: 18,
          description: "Age must be integer +18"
        },
        department: {
          bsonType: "string",
          enum: ["HR", "Engineering", "Finance"],
          description: "Department must be HR or Engineering or Finance" }
      }
    }
  }
})

/*2. Create new Database named Demo 
     And Collections named trainningCenter1, trainningCenter2  
    a. Insert documents into trainningCenter1 collection contains (Use Variable named data as Array) 
        _id , name as firstName lastName , age , address as array , status 
    b. Using insert ONE from data Variable 
    c. Using Same Variable (data) with same data and insert MANY into trainningCenter2 collection*/
use Demo

db.createCollection("trainningCenter1")
db.createCollection("trainningCenter2")

var data = [
  {
    _id: 1,
    firstName: "Moataz",
    lastName: "Elmesmary",
    age: 26,
    address: "Alexandria",
    status: "A"
  },
  {
    _id: 2,
    firstName: "Ahmed",
    lastName: "Mohamed",
    age: 23,
    address: "Cairo",
    status: "A"
  }
]

db.trainningCenter1.insertOne(data[0])
db.trainningCenter2.insertMany(data)


//3. Use find. explain function (find by age field) and mention scanning type 
db.trainningCenter1.find({ age: 26 }).explain("executionStats")  //COLLSCAN

//4. Create index on created collection named it “IX_age” on age field  
db.trainningCenter1.createIndex({ age: 1 }, { name: "IX_age" })

//5. Use find. explain view winning plan for index created (find by age field) and mention scanning type 
db.trainningCenter1.find({ age: 26 }).explain("executionStats")  //IXSCAN

/*6. Create index on created collection named it “compound” on firstNsme and lastName 
    a. Try find().explain before create index and mention scanning type 
    b. Try find().explain after create index and mention scanning type*/
db.trainningCenter1.createIndex({ firstName: 1, lastName: 1 }, { name: "compound" })

db.trainningCenter1.find({ firstName: "Moataz", lastName: "Elmesmary" }).explain("executionStats")

db.trainningCenter1.find({ firstName: "Moataz", lastName: "Elmesmary" }).explain("executionStats")

//7. Try deleteOne , deleteMany from any Collection 
db.trainningCenter1.deleteOne({ _id: 1 })
db.trainningCenter2.deleteMany({ status: "A" })

//8. Drop Demo Database 
db.dropDatabase()
