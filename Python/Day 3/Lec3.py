# Multiple Inheritance

# class Class1:
#     def __init__(self):
#         print('I\'m Instructor')
#     def m(self):
#         print("I'm in Class1")
        
# class Class0(Class1):
#     def m(self):
#         print("I'm in Class0")
#         super().m()
              
# class Class2(Class0):
#     def m(self):
#         print("I'm in Class2")
#         super().m()
      
# class Class3(Class1):
#     def m(self):
#         print("I'm in Class3")
#         super().m()

# class Class4(Class3,Class2):
#     def m(self):
#         print("I'm in Class4")
#         super().m()
        
# obj = Class4()
# obj.m()


# Multi Level Inheritance
# class A: # parent 
#     def __init__(self):
#         print('Init A',self)
#     def f1(self):
#         print('F1A')
#     def f2(self):
#         print('F2A')
#     def f3(self):
#         print('F3A')
        
# class B(A): # parent and child 
#     def __init__(self):
#         super().__init__()
#         print('init B',self)
#     def f1(self):
#         print('F1B')
#     def f2(self):
#         print('F2B')

# class C(B):
#     def __init__(self):
#         super().__init__()
#         print('init C',self)
#     def f1(self):
#         print('F1C')

# cobj = C()
# cobj.f1() # F1C
# cobj.f2() # F2B
# cobj.f3() # F3A


# class A: # parent 
#     def f1(self):
#         return 'F1A'
#     def f2(self):
#         return 'F2A'
#     def f3(self):
#         return 'F3A'
    
# class B(A):
#     def __init__(self):
#         print("Constructor")
#     def f1(self):
#         return 'F1B ' + super().f1()
#     def f2(self):
#         return 'F2B ' + super.f2()
    
# class C(B):
#     def __init__(self):
#         super().__init__()
#     def f1(self):
#         return 'F1C ' + super().f1()
#     def f2(self):
#         return 'F3C ' + super().f3()
# cobj = C()
# print(cobj.f1()) # F1C F1B F1A
# print(cobj.f2()) # F3C F3A
# print(cobj.f3()) # F3A 


# Polymorphism

# print(len('python'))
# print(len(['Python', 'java', 'c++']))
# print(len({"Name":"Mohamed" , "Address":"Egypt"}))

"""
Task 8

reverse string using lambda function 

"""

# str = "Mohamed"
# print(str[::-1])

# rev_str = lambda str: str[::-1]

# print(rev_str("Mohamed"))

# str[::]

"""
# Positive Indexing
 0   1   2    3    4   5
 M   O   H    M    E   D
-6  -5  -4   -3   -2  -1
# Negative Indexing

str[0]  -> M
str[-6] -> M
str[:4] -> M O H M
str[:-6] -> M

[start : end : step]

"""
# str = "Mohamed"
# print(str[1:4:1])
# print(str[:-4:-1])
# print(str[::-1])

# class Employee:
#     name = None
#     salary = None
#     address = None

# def print_emp(obj):
#     print('Employee name: ', obj.name)
#     print('Employee Salary: ', obj.salary)
#     print('Employee address: ', obj.address)

# def read_emp():
#     obj = Employee()
#     obj.name = input('Enter Employee name: ')
#     obj.salary = float(input('Enter Employee Salary: '))
#     obj.address = input('Enter Employee Address: ')
    
#     return obj

# if __name__ == '__main__':
#     emp = read_emp()
#     print_emp(emp)


# Access Modifiers 
""""
Public member: Accessible anywhere from outside class.
Private member: Accessible within the class.
Protected member: Accessible within class and it's sub-classes
"""

# public members
# class Employee:
#     def __init__(self,name, salary):
#         # public data members
#         self.name = name
#         self.salary = salary
        
#         # public instance methode
#     def show(self):
#         print("Name: ", self.name, "Salary: ", self.salary)
        
# emp = Employee("Mohamed", 5000)

# # access data member outside class
# print("Name: ", emp.name, "Salary: ", emp.salary)

# emp.show()

# private members
# class Employee:
#     def __init__(self,name, salary):
#         # public data members
#         self.name = name
#         # private member
#         self.__salary = salary
    
#     def show(self):
#         print("Name: ", self.name, "Salary: ", self.__salary)

# emp = Employee("Mohamed", 5000)
# emp.show()