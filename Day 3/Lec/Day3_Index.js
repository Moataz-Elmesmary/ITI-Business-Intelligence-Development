//new DB
use SD

db.staff.insertOne({_id:1, fName:"noha",lName:"ahmed"})

db.staff.find({}).explain() //winningPlan =>  "stage" : ""

//serach by _id
db.staff.find({_id:1}).explain()//winningPlan => "stage" : ""

//search by fName or lName
db.staff.find({fName:"noha"}).explain() //winningPlan => "stage" : ""

db.staff.createIndex({fName:1} , {name:"IX_Staff_fName"})
db.staff.find({fName:"noha"}).explain() //winningPlan => "stage" : ""

db.staff.find({lName:"ahmed"}).explain() //winningPlan => "stage" : ""

db.staff.find({fName:"noha",lName:"ahmed"}).explain() //winningPlan => "stage" : "" ,""

db.employee.insertOne({_id:1 , fName:"mohamed" , lName:"ali"})

db.employee.createIndex({fName:1,lName:1},{name:"IX_Employee_Names"})

db.employee.find({fName:"mohamed",lName:"ali"}).explain() //winningPlan => "stage" : "" ,""
