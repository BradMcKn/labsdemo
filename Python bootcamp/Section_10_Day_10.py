# functions with outputs
#uncommente code to see how it works

# create a function that formats a person's name using title case, the if statement is used to check for empty inputs and is not needed for a simple formatting function.

# def format_name(f_name, l_name):
#     if f_name == "" or l_name == "":
#         return "You didn't provide valid inputs."
#     formatted_f_name = f_name.title()
#     formatted_l_name = l_name.title()
#     return f"{formatted_f_name} {formatted_l_name}"
# print(format_name(input("What is your first name? "), input("What is your last name? ")))

#function one with input to function two with output

# def function_one(text):
#     return text + text

# def function_two(text):
#     return text.title()

# output = function_two(function_one("hello"))
# print(output)

#leap year checker

# def is_leap_year(year):
#     if year % 4 == 0:
#         if year % 100 == 0:
#             if year % 400 == 0:
#                 return "is a leap year."
#             else:
#                 return "is not a leap year."
#         else:
#             return "is a leap year."
#     else:
#         return "is not a leap year."
             

# print("Welcome to the leap year checker!")
# year = int(input("Which year do you want to check? "))

# print(f"{year} {is_leap_year(year)}")


#python calculator
# create a function that takes in two numbers and an operator and performs the corresponding calculation

def calculator(num1, num2, operator):
    if operator == "+":
        result = num1 + num2
    elif operator == "-":
        result = num1 - num2
    elif operator == "*":
        result = num1 * num2
    elif operator == "/":
        result = num1 / num2
    else:
        return "Invalid operator"
    
    # Return integer if result is a whole number, otherwise return decimal
    if result % 1 == 0:
        return int(result)
    else:
        return result
print("Welcome to the calculator!")

continue_calculating = True

while continue_calculating:
    number1 = float(input("Enter the first number: "))
    operator = input("Enter an operator (+, -, *, /): ")
    number2 = float(input("Enter the second number: "))
    
    print(calculator(number1, number2, operator))
    
    user_choice = input("Are you done? (y/n): ").lower()
    
    if user_choice == "y":
        continue_calculating = False
        print("Thanks for using the calculator!")
    elif user_choice == "n":
        continue_calculating = True
    else:
        print("Invalid input. Exiting calculator.")
        continue_calculating = False   