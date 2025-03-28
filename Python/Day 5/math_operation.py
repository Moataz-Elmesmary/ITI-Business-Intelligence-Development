def add(num1, num2):
    return num1 + num2

def subtract(num1, num2):
    return num1 - num2

def multiply(num1, num2):
    return num1 * num2

def divide(num1, num2):
    try:
       num2 = int(num2) and num2 != 0
    except ZeroDivisionError:
        print("Error: Divied zero not allowed")
    else:
        return num1 / num2
