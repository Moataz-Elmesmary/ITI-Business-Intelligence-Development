//----------employees Collection
//1.employess Total Salary for "Sales" Department 
db.employees.find({})


//2.Avg Salaries for "each Department" "sorted Desc"

//$group : _id (Object) =>department name , Date
db.employees.aggregate([{
    $group:{

    _id:{dep:"$department",date:"$hireDate"},
        avg:{$avg:"$salary"}
    }
},
{
        $sort:{avg:-1}
}])


//----------------------------orders collection
db.orders.find({})
//3.total quantity Pizza order for "medium" Pizza grouped by name with "asc order" 

//4.Calculate Avg Pizza order for "medium" within dates 
//From 2020 to 2022
//grouped dy "date" ,"Sorted by Date Desc" 
// and insert result to new Collection 


//--------------- products Collection
db.products.find({})

//5. Total Sales Amount Per Product:
//Query: Calculate the total sales amount for each product.
// Total Sales = Sum of quantity * price

//6. Yearly Sales Trends:
//Query: Get the "Laptop" total sales amount for "each year"
// over a given time period from 2020 to 2024

//7. Top 1 Customer by Total Spending:
//Query: Find the top 1 customers who spent the most.
//---------likes Collection

//8.total likes foreach tile

//9. Avg likes foreach tile 
