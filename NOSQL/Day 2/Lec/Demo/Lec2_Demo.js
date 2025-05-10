
//Find: Show and Hide Columns (inventory : tags, _id)

//Find: Not Null Values (inventory :tags)

//Find: Show Not Null Values (inventory :tags) and Hide Columns (inventory : tags, _id)

//Find Data Inside Object (item.name)


//$eq , $in , $gt (inventory)
//Text (status)

//Number (qty)

//$eq , $gte , $lte

//$in Simple Field (qty)

//$in Array Field (tags)

//$and , $or
//Find Where Tags in ["red","blank"] and qty Greater Than or Equal 90

//Find Where Tags in ["red","blank"] Or qty Greater Than or Equal 90

//Find Where Tags in ["red","blank"] and qty Greater Than or Equal 90
//And (item:"paper" or qty:130)

//Schema Validation:


//First : Insert On New Collection Has No Validation
//Apply Validation Schema

    
//Regular Expression (inventory :item)

//Find From inventory Where item Start With note (/note.*/ )

//Find From inventory Where item Not Start With note (/note.*/ )


//Ignore Case Sensetive (products)
db.products.insertMany([{item:"ABC"},{item:"abc"}])

db.products.find({item:"ABC"})

db.products.find({item:"abc"})


db.products.find({ item: { $regex: "(?i)abc" } } )

//Array Operator $in , $all

db.inventory.find({tags:{$in:["red","blank"]}})

db.inventory.find({tags:{$all:["red","blank"]}})


db.inventory.find({"dim_cm":{$elemMatch:{$gt:20,$lt:30}}})

db.inventory.find({tags:{$size:2}})

db.inventory.find({tags:{$size:3}})

db.inventory.find({qty:{$type:"array"}})

//Update Operator (employees : salary)
db.employees.find({salary:60000})

//UpdateOne (employees : department) 

db.employees.updateOne({salary:60000},
{
    $set:
    {
       department:"New HR" 
    }
})

db.employees.find({salary:60000})

//UpdateMany (employees :Add New Field) 

db.employees.updateMany({salary:60000},
{
    $set:
    {
        MyAge:25
    }
})

db.employees.find({salary:60000})

//Update All Without Condition

db.employees.updateMany({},
{
    $set:{
        age : 25
    }
}
)

db.employees.updateMany({},
{
    $rename:{
        "age":"employeeAge"
    }
}
)

db.employees.find()

//$unset
db.employees.updateMany({},
{
    $unset:{
        employeeAge:""
    }
})

db.employees.find({_id:1})

//UpSert , On Insert

db.employees.updateOne({_id:2},
{
    $set:{
        age : 35
    },
    $setOnInsert:
    {
        notes:"newly added"
    }
},
{upsert:true}
)

db.employees.find({_id:2})

//Replace
db.employees.replaceOne({_id:2},
{
    email:"m@gmail.com",
    address:"alex"
})

db.employees.updateOne({_id:2},
{
    $set:{
        age : 35
    },
},
{upsert:true}
)

db.employees.updateOne({_id:2},
{
    $set:{
        age : 35
    },
    $currentDate:{
        updatedDate:true
    }
}
)

db.employees.find({_id:2})

db.products.find({sku: "abc123"})

db.products.updateOne(
   { sku: "abc123" },
   { $mul: { quantity: 10 } }
)
