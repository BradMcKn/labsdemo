#Python Loops range

#for loop
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
# Output: will be apple, banana, cherry each in new line as it loops through the list. The variable fruit takes the value of each item in the list one by one.

fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
    print(fruit + " pie") 
# Output: will be apple, apple pie, banana, banana pie, cherry, cherry pie each in new line as it loops through the list.

#highest score
students_scores = [180, 124, 165, 173, 189, 169, 146]
#total_exam_score = sum(students_scores) #function to sum up all the scores in the list
#print(total_exam_score)

max_score = 0
for score in students_scores:
    if score > max_score:
        max_score = score
print(f"The highest score in the class is: {max_score}")

#Range function
for number in range(1, 11): #range function generates numbers from 1 to 10 (11 is excluded)
    print(number)

for number in range(1, 11, 3): #step argument to increment by 3
    print(number)

#the Gauss challange sum of numbers from 1 to 100
total = 0
for number in range(1, 101):
    total += number
print(total)


#fizz buzz game
for number in range(1, 101):
    if number % 3 == 0 and number % 5 == 0:
        print("FizzBuzz")
    elif number % 3 == 0:
        print("Fizz")
    elif number % 5 == 0:
        print("Buzz")
    else:
        print(number)

#pypassword generator code challange note this should be modularized into functions for better practice

#list of letters, numbers and symbols
import random
letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
symbols = ['!', '#', '$', '%', '&', '(', ')', '*', '+']

print("Welcome to the PyPassword Generator!")
nr_letters = int(input("How many letters would you like in your password?\n"))
nr_symbols = int(input("How many symbols would you like?\n"))
nr_numbers = int(input("How many numbers would you like?\n"))


genterated_password = []
for char in range(1, nr_letters + 1):
    genterated_password.append(random.choice(letters))
for char in range(1, nr_symbols + 1):
    genterated_password.append (random.choice(symbols))
for char in range(1, nr_numbers + 1):
    genterated_password.append (random.choice(numbers))
random.shuffle(genterated_password)
genterated_password = ''.join(genterated_password)
print("Generating your password..." + genterated_password)







