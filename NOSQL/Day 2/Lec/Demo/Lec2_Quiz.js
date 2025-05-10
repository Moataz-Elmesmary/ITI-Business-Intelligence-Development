use task

db.quiz.insertMany([
{_id:1,name:"eman",age:15},
{_id:2,emial:"ahmed@gmial.com"}
])

//Query 1
db.quiz.updateMany({},
{$set:{status:"A"}})

//test Data
db.quiz.find({})

//Query 2
db.quiz.updateMany({_id:5},
{
    $set:{status:"VIP"}
},
   {upsert:true})

//test Data
db.quiz.find({})

//Query 3
db.quiz.updateMany({_id:10},
{
    $set:{status:"VIP"},
    $setOnInsert:{age:40}
},
   {upsert:true})

//test Data
 db.quiz.find({})
   