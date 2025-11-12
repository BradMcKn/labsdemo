#Python Data Types and how to manipulate strings

#example of subscripting this is not a data type but an operation that can manipulate a data type.

# 0 prints first letter of Hello which is H which is the index 0 or position of the character in the string. this can be reversed by using negative indexing example -1 would print the last letter of the string

print("Hello"[0]) 
print("Hello"[4])
print("Hello"[-1])

#example of integer data type which is a whole number
print(123 + 345)

#large numbered integers can use underscores to make them easier to read
print(123_456_789)

#float data type which is a decimal number
print(3.14159)

#boolean data type which is either True or False
print(True)
print(False)

#if unsure about the data type you can use the type() function to find out
print(type("Hello"))
print(type(123))
print(type(3.14))
print(type(True))

#you can also convert data types using functions like str(), int(), float()
print(int("123") + int("456"))

print("Number of letters in your name: " + str(len(input("Your Name : "))))

#math operations can be performed on integers and floats
print(23 + 50)
print(100 - 29)
print(10 * 5)
print(50 / 2)
print(50 // 2) #floor division removes decimal points remember it is best to use this when working with whole numbers that are divisiable by each other
print(2 ** 9) #exponentiation 2 to the power of 3

#PEMDAS - Parentheses Exponents Multiplication Division Addition Subtraction this needs to be done with multiple brackets in order for the operation to be correct
print(3 * (3 + 3) / 3 - 3)

#code Exercise BMI Calculator
height = input("Enter your height in Inch: ")
weight = input("Enter your weight in Pounds: ")
bmi = (int(weight) / (int(height) ** 2)) * 703
print("Your BMI is: " + str(int(bmi)))

#assinging operators += -= *= /= this is a shorthand way of writing operations
score = 0

score += 1
print(score)

#f-strings for easier string manipulation and concatenation
score = 0
height = 1.8
isWinning = True
print(f"Your score is {score}, your height is {height}, you are winning is {isWinning}")

#day 2 of python project a tip calculator
print("Welcome to the tip calculator!")
bill = float(input("What was the total bill? $"))
tip = int(input("What percentage tip would you like to give? 10, 12, or 15? "))
people = int(input("How many people to split the bill? "))
tip_as_percent = tip / 100
total_tip_amount = bill * tip_as_percent
total_bill = bill + total_tip_amount
bill_per_person = total_bill / people
final_amount = round(bill_per_person, 2)
print(f"Each person should pay: ${final_amount}")



