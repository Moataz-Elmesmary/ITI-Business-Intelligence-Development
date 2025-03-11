# Slicing in list
# list is a zero based indexing
# lst = [1,2,3,4,5,6]
# print(type(lst))

# #lst [start, end-1, steps]
# sl = lst[1:4]
# print(sl)
# print(lst[::])
# print(lst[::-1])
# lst = [1,2,3,4,5]
# print(lst[-1])
# print(lst[-2])


# sl_lst = lst[2:1000000]
# print(sl_lst)
# print(lst[6])
# for i in range(0,7):
#     print(lst[i])

# List Comperehension
# lst = [expression for iterator in lst 'condition']

# lst = [1,2,3,4,5,6]
# lst2 = []
# for i in lst:
#     lst2.append(i*i+1)
# print(lst2)

# # list comperehension
# lst3 = [i*i+1 for i in lst]
# print(lst3)

# lst4 = [1,2,-4,3,-3,-7,-6,6,1]
# lst5 = []
# for i in lst4:
#     if i > 0 and i % 2 == 0:
#         lst5.append(i)
# print(lst5)


# lst6 = [i for i in lst4 if i>0 and i % 2 == 0]
# print(lst6)

# lst1 = [1,2,3]
# lst2 = [4,5,6]


# lst1 = [1,2,3]
# lst2 = [4,5,6]
# print(lst1 + lst2)

# con = [*lst1, *lst2]
# print(con)

# Name Binding
# a,*b,c = 1,2,3,4,5,6,7
# print(a)
# print(b)
# print(c)

"""
*lst1 = 1,2,3
*lst2 = 4,5,6

con = [*lst1, *lst2] -> [1,2,3 , 4,5,6]
"""
# con = [*lst1,*lst2]
# print(con)


"""
Loops
while loop
for loop
"""

"""
While loop
1- initialization
2- condition
3- action / body
4- steps
"""
# x = 1 # initialization
# while x <= 5: #condition
#     print(x, end = " ") # action
#     x+=1 # step
# print()
# print(x)



# Map -> (function, iterate)
# num1,num2 = map(float, input("Enter 2 number: ").split())
# print(num1, num2)
# print(type(num1), type(num2))

"""
break -> tell computer stop this condition

continue -> tell computer jump to the while start again continue from there 
"""

# read 2 number from user print float division if 2nd number zero -> print bye and end the program

# while True:
#     num1,num2 = map(float, input("Enter 2 number: ").split())
#     if num2==0:
#         print("Num2 is zero: ")
#         continue
#     print(num1/num2)
#     break
    
# print("bye")

# lst = []
# for i in range(5):
#     x = float(input("Enter number: "))
#     lst.append(x)
# print(lst)

# for i in lst:
#     print(i)

"""
Tuples
Dictionary
Set
Functions
"""

"""
num = 00592 -> 5 9 2
dig = 3

1
num = 5
dig += 1
dig = 1

2
num = 9
dig += 1
dig = 2

3
num = 2
dig += 1
dig = 3

592 /  10 -> 59.2
592 // 10 -> 59
dig+=1


"""

# num = int(input("Enter your number: ")) # 592
# cnt_dig = 0
# while num > 0:
#     cnt_dig+= 1
#     num = num // 10
# print(cnt_dig)


# Tuples
# another an order collections of objects
# similer list
# iter , indexing, slicing, comparason, func -> min, max, sorted()

# more
"""
immutable data type: we can't change or delete iths item
many methods -> append , insert , remove
"""

# tup = (5,6,7,8,1,2,3)
# print(type(tup))

# *num1,num2,num3 = tup

# print(num1,num3)

# creation
# tup2 = ("iti", 12, 3.4, [1,2,3])
# print(tup2)
# print(len(tup2))
# t = tuple("ITI")
# print(t)
# print(type(t))



# tup3 = ('ITI',)
# print(type(tup3))
# print(tup3)

# tup4 = tuple('ITI')
# print(type(tup4))
# print(tup4)


# str3 = 'ITI'
# print(str3)

# Unpacking -> use star on variable
# tup = (5,6,7)
# print(type(tup))
# print(tup[0])

# num1,num2,num3 = tup
# print(num2,num3)

# lst = (1,2,3,4,5,6,7)
# a,*b,c = lst
# print(a,c)
# print("B Var: ",b)

# print(type(lst))


# Set - set() -data-structure -> not repeated any values and sorted this values

lst = [1,2,3,1,"Test",2,3,1,4,5,6,0,0,"Test2"]
st = set(lst)
print(st)
print(type(st))

# Error
# st[0] = 1
# print(st)


"""
Dictionary
like -> list but have key:value
key   -> immutable
value -> mutable
"""

# dic = {
#     key1:value1,
#     key2:value2
#     }

# dic = {
#     0:1,
#     1:2,
#     213:3
# }

# print(dic[213])
# print(dic[0])


# dic2 = {
#     'P':"Python",
#     'I':"ITI",
#     'T':'BI'
# }

# print(dic2)
# print("Keys Dic:",dic2.keys())
# print("Values Dic:",dic2.values())
# print("ITems:",dic2.items())
# print(dic2.popitem())
# lst = dic2.items()
# print(type(lst))
# print(dic2['P'])


# update and delete
# dic3 = {}


# dic3[12] = [213, (5, "ITI")]
# dic3["ITI"] = 20

# print("Dic_3 Keys: ",dic3.keys())
# print("Dic_3 Values: ",dic3.values())


# print(dic3)
# print(dic3[12][1][1][1])

# dic4 = {
#     #Error
#     ["ITI", "Track"] : ["Mansoura", "BI"],
#     5: "Test"
# }
# # 5 -> "Test"

# print(dic4.keys())



# dic3 = {}


# dic3[12] = [213, (5, "ITI")]
# dic3["ITI"] = 20

# # Delete function -> del
# del dic3[12]
# print(dic3)


# Indexing dic value
# dic = {
#     "ITI" : "Learn",
#     1 : [1,5,7,8],
#     3 : [[3,4], [8,9,10]]
# }

# print(dic["ITI"])
# print(dic["ITI"][-1])
# print(dic[1][1])
# print(dic[3][1][1])


"""
set -> remove dublicate each element in set is unique
"""
# dic = {
#     int: ['Test1','Test2',3],
#     2: 40,
#     2: 50
# }

# print(dic[int])
# print(dic[2])

# det method
# print(dic.get(2))
# print(dic.get(5,0))
# print(dic[int][0])

# dic = {'x':11, 'b':22, 'y':30 }

# add new value | Update dic with new value
# dic['a'] = 33
# print(dic)
# print(dic.pop('x'))
# print(dic)

# while dic:
#     print(dic.popitem())

# print("After Wile loop:")
# print(dic)

# clear -> dic.clear() -> remove all keys

# print(dic)
# print(dic.clear())
# print("dic after clear\n",dic)

# lst = [1,2,3,4]
# print(lst.pop())


# nested if condition
"""
user enter number
number check if between 100 , 200 -> let's go
and if num even -> your number is even
and if num = 150 -> your number is lucky
"""

# num = int(input("Enter ypur number: "))
# # if num >= 100 and num <=200:
# if 100 <= num <= 200:
#     print('let\'s go')
#     if num %2 == 0:
#         print("your number is even")
#         if num == 150:
#             print('your number is lucky')
#         else:
#             print('Your number is not a lucky number.')
#     else:
#         print("Your Number is Odd. ")
# else:
#     print("Enter number in range. ")

# Minimum number of 3 num
# n1,n2,n3 = map(int,input("Enter 3 numbers: ").split())
# if n1 < n2 and n1<n3:
#     print(n1, "is the minimum number. ")
# elif n2 < n1 and n2<n3 :
#     print(n2, "is the minimum number. ")
# else:
#     print(n3, "is the minimum number. ")

"""
num1 = 5
num2 = 3
num3 = 2

ans = num1
ans = 5
ans = num2 = 3
ans = num3 = 2
qns = 2
"""
# num1,num2,num3 = map(int,input("Enter 3 numbers: ").split())
# ans = num1
# if ans > num2:
#     ans = num2
# if ans > num3:
#     ans = num3
    
# print(ans)

"""
i[0] = 1
i[1] = 2

i[0] added new list -> i[0]*i[0] + 1 -> 1*1+1 = 2
i[0] = 2

i[1] added new list -> i[1] * i[1] + 1 -> 2*2+1 = 5
i[1] = 5
"""
# lst = [1,2,3,4,5,6]
# lst2 = []
# for i in lst:
#     lst2.append(i*i+1)
# print(lst2)
# # list comperehension
# lst3 = [i*i+1 for i in lst]
# print(lst3)
# lst3.pop()
# print(lst3)

# lst = [1,5,-5,-6,3,4,8,-9,7 ]
# lst2 = []
# for i in lst:
#     if i >0:
#         lst2.append(i)
# print(lst2)

# lst3 = [i for i in lst if i > 0 if i%2==0 ]
# print(lst3)

# lst1 = [12,13,14]
# lst2 = [15,16,17]
# conc = lst1 + lst2
# print(conc)
# lst1.extend(lst2)
# newlst = lst1
# print(lst1)
# concat3 = [*lst1, *lst2]
# print(concat3)



