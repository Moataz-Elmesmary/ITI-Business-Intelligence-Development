//ObjectId()

//show dbs
//use NewForStudent
//show collections

//use AI
////Find
db.employees.find({})
db.inventory.find({})

////Find , Show and Hide Column
db.inventory.find({_id:3},{item:true,_id:false})
db.inventory.find({},{item:true,tags:true,_id:false})

db.inventory.find({},{item:true,_id:false})

db.inventory.find({},{item:true,tags:false})

//Insert
use NewForStudent

db.employees.insertOne({
  "_id": 200,
  "name": "ahmed",
  "address": [
    {
      "name": "Eg",
      "value": "alex maimai"
    },
    {
      "name": "KSA",
      "value": "Jedda"
    }
  ]
})

///Find the Inserted Record
db.employees.find({_id:200})

///Delete the Inserted Record
db.employees.deleteOne({_id:200})
