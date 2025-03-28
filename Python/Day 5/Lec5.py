# 
# File handling 
# Excpetion handling
# try{
#     ...
# }
# catch{
    
# }
# catch{
    
# }
# Modules
# from ... import ... 

# File Handling
# File paths:
# 1- Absolute path -> Full path from root directory -> C:\Users\user\Desktop\file.txt
# 2- Relative Path -> current working directory -> file.txt
# ___________________________
# File Modes:
# r: Read from file
# w: write from file -> overwrite existing content
# a: append file 
# b: binary mode
# +: Read/Write mode (r+ open file for both reading and writing)
# ___________________________

# TextFile , Binary file
# Text file -> .txt, .csv, .html, .xml, .json : Humen readable
# Binary files: .jpg, .mp3, .mp4, .exe : Not human readable

# Reading from files:
# read() -> read all content of file
# readline() -> read one line at a time
# readlines() -> read all lines and return as list


# Writing to files:
# write(): write string to file
# writelines(): write list of strings to file

# with open("newFile.txt", "w") as file:
#     file.write("Hello World\n")
#     file.writelines(["newPython\n", "Power BI\n", "Tableau\n"])
    

# with open("newFile.txt", "r") as fileRead:
#     text1 = fileRead.read() # read content existing file
#     text2 = fileRead.readline() # read one line
#     text3 = fileRead.readlines() # read all lines and return as list
    
    
    # print(text1)
    # print(text2)
    # print()
    # print(text3)
    
# with open("qr-code(1).jpg", "rb") as bina:
#     data = bina.read() # return image as byte
#     print(data)

# with open("add_image", "wb") as writeBin:
#     file.write("content")
    
# file.close()


# Exception Handling

# try: try to run this code with this logic
# except: if any exception occurs, run this code

# def read_age(msg):
#     try:
#         age = input(msg)
#         age = int(age)
#     except:
#         age = None
#     return age

# test = read_age("Enter Your Age: ")
# print(test)

# casting -> convert from data type to another data type


# age = input("Enter Your Age: ")
# ConVage = int(age)
# print(ConVage)
# age = int(age)


# def read_age(msg):
#     try:
#         age = input(msg)
#         age = int(age)
#     except:
#         print("Invalid Input")
#         age = None
#     else:
#         print("Thanks")
#     return age

# test = read_age("Enter Your Age: ")
# print(test)


# def read_age(msg):
#     try: # -> process code 
#         age = input(msg)
#         age = int(age)
#     except: # execute this code when the is an exception 
#         print("Invalid Input")
#         age = None
#     else: # -> No Exception , run code
#         print("Thanks")
#     finally: #-> Always run this code
#         print("End function")
#     return age

# test = read_age("Enter Your Age: ")
# print(test)


# try:
#     divied = 10
#     divisor = int(input("Enter Divisor: "))
#     result = divied / divisor
# except ZeroDivisionError:
#     print("Error: Divied zero not allowed")
# else:
#     print("result", result)
    
    
# from math import sqrt

"""
modules is file that contain python code
modules can define functions, classes, and excecutable code.
"""


