//1.	Find documents where the "tags" field exists.
db.inventory.find({tags: { $exists: true }} )

//2.	Find documents where the "tags" field does not contain values "ssl" or "security."
db.inventory.find( {tags: 
    { $nin: ["ssl", "security"] } } )

//3.	Find documents where the "qty" field is equal to 85.
db.inventory.find({ qty: 85 } )

//4.	Find documents where the "tags" array contains all of the values [ssl, security] using the `$all` operator.
db.inventory.find( { tags: 
    { $all: ["ssl", "security"] } } )

//5.	Find documents where the "tags" array has a size of 3.
db.inventory.find({ tags: { $size: 3 } } )

/*6.	Update the "item" field in the "paper" document, setting "size.uom" to "meter" and using the `$currentDate` operator.
a.	Also, use the upsert option and change filter condition item:”paper”.
b.	Use the `$setOnInsert` operator.
c.	Try `updateOne`, `updateMany`, and `replaceOne`.*/

//updateOne
db.inventory.updateOne({ item: "paper" },
  {
    $set: { "size.uom": "meter" },
    $currentDate: { lastModified: true },
    $setOnInsert: { createdBy: "admin" }
  },
  { upsert: true }
)

// updateMany
db.inventory.updateMany({ item: "paper" },
  {
    $set: { "size.uom": "meter" },
    $currentDate: { lastModified: true },
    $setOnInsert: { createdBy: "admin" }
  },
  { upsert: true }
)

// replaceOne
db.inventory.replaceOne( { item: "paper" },
  {
    item: "paper",
    size: { uom: "meter" },
    lastModified: new Date()
  },
  { upsert: true }
)



//7.	Insert a document with incorrect field names "neme" and "ege," then rename them to "name" and "age."
db.inventory.insertOne({ neme: "John", ege: 25 })

// Rename
db.inventory.updateOne(
  { neme: { $exists: true }, ege: { $exists: true } },
  { $rename: { "neme": "name", "ege": "age" } }
)


//8.	Try to reset any document field using the `$unset` function.
db.inventory.updateOne( { item: "paper" },

  { $unset: { "size.uom": "" } }
)

//9.	Try update operators like `$inc`, `$min`, `$max`, and `$mul` to modify document fields.
db.employees.insertOne({
  name: "Moataz",
  salary: 1000,      
  minValue: 900,       
  maxValue: 1200,     
  multiplier: 5        
})

db.employees.updateOne({ name: "Moataz" },

  {
    $inc: { salary: 100 },          
    $min: { minValue: 800 },      
    $max: { maxValue: 1500 },   
    $mul: { multiplier: 2 }       
  }
)


//10.	Calculate the total revenue for product from sales collection documents within the date range '01-01-2020' to '01-01-2023' and then sort them in descending order by total revenue.
//a.	Total Revenue=  Sum (Quantity * Price)
db.sales.aggregate([
  {
    //Match Stage    
    $match: {
      date: {
        $gte: ISODate("2020-01-01"),
        $lte: ISODate("2023-01-01") } }
  },
  {
    $project: {
      product: 1,
      revenue: { $multiply: ["$quantity", "$price"] }
    }
  },
  {
    //Group Stage    
    $group: {
      _id: "$product",
      totalRevenue: { $sum: "$revenue" } }
  },
  {
    //Sort Stage  
    $sort: { totalRevenue: -1 }
  }
])


//11.	Calculate the average salary for employees for each department from the employee’s collection.
db.employees.aggregate([
  { $group: {
      _id: "$department",
      avgSalary: { $avg: "$salary" } } }
])

//12.	Use likes Collection to calculate max and min likes per title
db.likes.aggregate([
  {  $group: {
      _id: "$title",
      maxLikes: { $max: "$likes" },
      minLikes: { $min: "$likes" } } }
])

