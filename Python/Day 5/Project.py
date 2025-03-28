"""
Employee Management System
Help our factory in managing the employees.


Create a program that provides the following operations:
1. Add Employee
2. Update Employee salary by name
3. Delete Employee by age
4. print all Employees
5. Exit


You will keep the program running forever.

○ Display the choices and user input from 1 to 5

Employee Class
Just holds the data and basic function for it

EmployeesManager Class
Holds a list of employees and has implementation for the menu options

FrontendManager Class
○ Print the menu, get a choice and call the employees manager

all data will be stored in a file


# System Design For project
1. Employee Class
store attributes of employee -> name, age, department, salary

functionality
display_information-> print employee details
to_dictioanry -> convert object to dictionary from json storage


2- EmployeesManager Class
Manages a List of employees
support CRUD operations -> create, read, update, delete

Implentation of file handling to store employee data as json file
List_all_Employees() -> display all employees records
add_employee -> add new employee to the list
dalete_by_age -> delete employee by age 
update_salary_by_name -> update salary of employee by name
save_to_file -> save employee data to file
load_from_file -> load employee data from file
exite_program -> exit the program


3- FrontendManager Class
Handle the user interface
Display menu and takes user input
Calls appropriate method from EmployeesManager


File Handling
file name: employee.json
formate: json (list of employees dictionary)

"""
# store attributes of employee -> name, age, department, salary

# functionality
# display_information-> print employee details
# to_dictioanry -> convert object to dictionary from json storage
class Employee:
    def __init__(self, name, age, department, salary):
        self.name = name
        self.age = age
        self.department = department
        self.salary = salary
    
    #f formate printing 
    def display_info(self):
        # print("Name", self.name)
        print(f"Name: {self.name}, Age: {self.age}, Department {self.department}, Salary {self.salary}")
        
    def to_dict(self):
        
        return{
            "name": self.name,
            "age": self.age,
            "department": self.department,
            "salary": self.salary
        }
        
# Break to : 12:20 pm


# Implentation of file handling to store employee data as json file
# List_all_Employees() -> display all employees records
# add_employee -> add new employee to the list
# dalete_by_age -> delete employee by age 
# update_salary_by_name -> update salary of employee by name
# save_to_file -> save employee data to file
# load_from_file -> load employee data from file
# exite_program -> exit the program
# {
#     key: value
# }
import json

class EmployeeManager:
    def __init__(self):
        self.employees = [] # store employees in list
        self.file_path = "employees.json"
        self.load_from_file()
        
    def add_employee(self, name, age, department, salary):
        self.employees.append(Employee(name, age, department, salary))
        self.save_to_file()
        print(f"Emplyee {name} added Successfully")
        
    def print_all_employees(self):
        if not self.employees:
            print("No Employees Found")
        else:
            for emp in self.employees:
                emp.display_info()
           
                 
    def update_salary_by_name(self, name, new_salary):
        # Update salary of employee by searching for their name
        for emp in self.employees:
            if emp.name == name:
                emp.salary = new_salary # update salary
                self.save_to_file() # save new changes
                print(f"Salary update for {name} to {new_salary}")
                return # exit after update
        print("Employee not found! ") # if name is not found
        
        """
        emp
        1- > [{ name: test1, age: 20, dep: test2, salary: 50},
        2- >    { name: test1, age: 20, dep: test2, salary: 50},
        3- >    { name: test1, age: 15, dep: test2, salary: 50}]
        
        """
    # delete Employee by age 
    def delete_by_age(self, age):
        # remove employee with specific age
        new_employees = [] # temporary list to store remaining employees
        for emp in self.employees:
            
            if emp.age != age: # Keep employees whose age is not specified age
                new_employees.append(emp)
                """
                new_emp = { name: test1, age: 20, dep: test2, salary: 50},{ name: test1, age: 20, dep: test2, salary: 50}
                """
        # employees = [{ name: test1, age: 20, dep: test2, salary: 50},{ name: test1, age: 20, dep: test2, salary: 50}]
        self.employees = new_employees #update emplyee list
        self.save_to_file() # save update list to file
        print(f"Employee with age {age} has deleted successfully. ")
        
        
    def save_to_file(self):
        # save employee data to json file
        emp_list = []
        for emp in self.employees:
            emp_list.append(emp.to_dict()) # convert object to dictionary
        with open(self.file_path, "w") as file:
            json.dump(emp_list, file) # write data to file
            
            
    def load_from_file(self):
        # Load Employee data from json file
        try:
            with open(self.file_path, "r") as file:
                data = json.load(file) # read json file
                self.employees =[]
                for emp in  data:
                    # convert ditionary to objects
                    self.employees.append(Employee(emp["name"], emp["age"], emp["department"], emp["salary"]))
        except (FileNotFoundError, json.JSONDecodeError):
            self.employees = [] # file is missing
    

# 3- FrontendManager Class
# Handle the user interface
# Display menu and takes user input
# Calls appropriate method from EmployeesManager
                
class FrontendManager:
    # Initialize employee manager
    def __init__(self):
        self.manager = EmployeeManager()
        
    def display_menue(self):
        # Show menu and process user input
        while True:
            print("\n\t\tEmployee Managment System\t\t")
            print("1) Add new Employee: ")
            print("2) Print All Employees: ")
            print("3) Delete By Age: ")
            print("4) Update Salary by name")
            print("5) End The Program | Exit")
            
            choice = input("Enter your Option: ") 
            
            # Add new Employee
            if choice == "1":
                name = input("Enter Name: ")
                age = int(input("Enter Age: "))
                department = input("Enter Dapartment: ")
                salary = float(input("Enter Salary: "))
                self.manager.add_employee(name, age, department, salary)
                
            # Print all Employees
            elif choice == "2":
                self.manager.print_all_employees()
            
            elif choice == "3":
                age = int(input("Enter Employee Age to Delete: "))
                self.manager.delete_by_age(age)
                
                
            elif choice == "4":
                name = input("Enter Name: ")
                new_salary = float(input("Enter New Salary: "))
                self.manager.update_salary_by_name(name, new_salary)
            
            # Exit program
            elif choice == "5":
                print("Exit Program .... ")
                break
            else:
                print("invalid choice, please try again ...")

if __name__ == "__main__":
    # run the program
    frontend = FrontendManager()
    frontend.display_menue()
            
            
        
        
        