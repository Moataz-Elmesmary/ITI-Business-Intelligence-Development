# def measurTemp(temp):
#     if temp < 37:
#         return "Too Cold"
#     elif temp > 37:
#         return "Too Hot"
#     return "Normal"


# print(measurTemp(37))

# def doSum(**kwargs):
#     for i in kwargs:
#         print(kwargs[i])
        
# doSum(x = 2, y = 26)

"""
x = 5         y = 4

x = x+y  -> x = 9
y = x-y  -> 9-4 = 5
x = x-y  -> 9-5 = 4

x = x*y  -> x = 20
y = x/y  -> 20/4 = 5  -> y = 5
x = x/y  -> 20/5 = 4  -> x = 4

"""

# print(True is 1)
# print(True is False)
# print(True is True)

# lst1 = [1,2,3]
# lst2 = [1,2,3]

# print(lst1 == lst2)
# print(lst1 is lst2)

# print(id(lst1))
# print(id(lst2))

# print(True is 1) # False

# print(True == 1) # True
# print(True == 0) # False
# print(True == "Test") # False
# print(True == 2) # False

# print(True == False) # 

# while(0):
#     print("Test")

# print(2==2)

# new_list = [expression for iterator in iterable]
"""
1 -> lst2 -> 1*1+1
2 -> lst2 -> 2*2+1

lst2 = [2,5,10,17]
"""
# lst1 = [1,2,3,4]
# lst2 = []
# for i in lst1:
#     lst2.append(i*i+1)
# print(lst2)

# # list comp
# lst3 = [i*i+1 for i in lst1]
# print(lst3)

# print positive value
# lst4 = [1,2,-4,3,-3,-7,6,-1]
# lst5 = []
# for i in range(len(lst4)):
#     if lst4[i] > 0:
#         lst5.append(lst4[i])
# print(lst5)

# lst6 = [i for i in lst4 if i>0]
# print(lst6)

# lst7 = [1,2,3,4]
# lst8 = [5,6,7,8]

# lst9 = zip(lst7,lst8)
# print(list(lst9))

"""
lst1 -> Mathimatics Grades
lst2 -> Arabi Grades
lst3 -> Student Name

"""

# lst10 = [50,60,70,80]
# lst11 = [60,90,80,56]
# lst12 = ['Mohamed', 'Ali', 'Sara', 'Esraa']

# for idx, i in enumerate(zip(lst10,lst11,lst12)):
#     print(idx," ",i)


# lst13 = [1,1,1,2,2,3,4,5,6,1,2,3,4,87]
# st = set(lst13)
# print(st)

# lst13 = [1,1,1,2,2,3,4,5,6,1,2,3,4,87]
# lst14 = []
# for i in lst13:
#     if i in lst14:
#         pass
#     else:
#         lst14.append(i)
# print(lst14)

"""
Parameter vs. Argument

1- Parameter: the var used in defineing the function
2- Argument: is an expression passed to the function

def fnName(param):
    ---
    ---
"""

# RETURN KEYWORD
# def our_min(fnum, snum):
#     if fnum < snum:
#         return fnum
#     else:
#         return snum

# def our_max(fnum, snum):
#     if fnum > snum:
#         return fnum
#     else:
#         return snum

# a,b = 10,20
# print("Minimum number is:", our_min(a,b))
# print("Maximum number is:", our_max(a,b))

# Multiple return 
# def fun():
#     return 1,2,3,4

# x = fun()
# print(type(x))
# print(x)

# a,b,c,d = x
# print(a)

"""
print number from input start to input end
start from user
end from user

start, start+1,...,end

"""
# def num(start, end):
#     for i in range(start, end+1):
#         print(i, end=" ")

# st,ed = map(int, input("Enter start and end number: ").split())
# num(st,ed)

# Name Binding 
# def fun(x, y=2, z=5):
#     sum = x+y+z
#     return sum

# print(fun(5))

# def fun2(x,*,y):
#     return x+y

# print(fun2(x=5,y=6))

"""
Classes


"""

# class Employee:
#     name = None
#     salary = None
#     address = None

# emp = Employee()
# emp.name = "Mohamed"
# emp.salary = 1000
# emp.address = "Mansoura"

# emp2 = Employee()
# emp2.name = "Ahmed"
# emp2.salary = 5000
# emp2.address = "Tanta"

# print(emp2.name) 


# Constructor
# class Employee:
#     def __init__(self,name, salary, address):
#         self.nm = name
#         self.sal = salary
#         self.add = address
# obj1 = Employee("Mohamed", 500, "Tanta")
# print(obj1.nm, obj1.sal, obj1.add)


# class Employee:
#     name = None
#     salary = None
#     address = None

# def print_emp(obj):
#     print("Emp name:", obj.name)
#     print("Emp salary:", obj.salary)
#     print("Emp address:", obj.address)
    
# emp = Employee()
# emp.name = "Ahmed"
# emp.salary = 500
# emp.address = "Giza"

# print(emp.name)
# print(emp.address)

# print_emp(emp)


# class Employee:
#     name = None
#     salary = None
#     address = None

# def print_emp(obj):
#     print("Emp name:", obj.name)
#     print("Emp salary:", obj.salary)
#     print("Emp address:", obj.address)
    
# def read_emp():
#     obj = Employee()
#     obj.name = input("Enter Employee name: ")
#     obj.salary = input("Enter Employee Salary: ")
#     obj.address = input("Enter Emp Address: ")
#     return obj
# emp = read_emp()
# print_emp(emp)


# Methods
"""
Methods are function inside class

define function inside the body class -> method

"""
# using . operator to call the methods

# class Employee:
#     name = None
#     salary = None
#     address = None

#     def print_emp(self):
#         print("Emp name:", self.name)
#         print("Emp salary:", self.salary)
#         print("Emp address:", self.address)
        
#     def read_emp(self):
#         self.name = input("Enter Employee name: ")
#         self.salary = input("Enter Employee Salary: ")
#         self.address = input("Enter Emp Address: ")

# emp = Employee()    
# emp.read_emp()
# emp.print_emp()

# class Employee:
#     def __init__(self, name, age):
#         self.name = name
#         self.age = age
        
#     def __str__(self):
#         return 'Employee '+self.name + ' is '+ str(self.age) + ' Years Old'
    
#     def __repr__(self):
#         return 'Employee '+self.name + ' is '+ str(self.age) + ' Years Old'
    
# emp = Employee('Mohamed', 28)
# print(emp)

"""
Lambda function
is a small anonymous function
can take any numbers of argument, but can have only one expression

"""

x = lambda a,b : a*b
print(x(5,6))


# x = lambda a,b,c : a*b+c
# print(x(5,6,10))

# def fun(n):
#     return lambda a: a*n

# double = fun(2)
# print(double(10))

# lst = ["mohamed Omer", "ahmed Sayed", "ali Esmaile"]
# num = [4,2,7,8,1,0,9]
# num.sort()
# print(num)

# lst.sort(key=lambda lname: lname.split()[-1])
# print(lst)
