#Conditional Statements, Logical Operators, Code Blocks and Scope

#If, Elif, Else Statements this is how we make decisions in our code
print("Welcome to the rollercoaster!")
height = int(input("What is your height in cm? "))
if height >= 120:
    print("You can ride the rollercoaster!")
else:
    print("Sorry, you have to grow taller before you can ride.")


#Modulo Operator
#The modulo operator (%) gives us the remainder after division of two numbers.
print(10 % 5)  # Outputs 0 because 10 divided by 5 has no remainder 
print(10 % 3)  # Outputs 1 because 10 divided by 3 leaves a remainder of 1  

#Using Modulo to Check for Even or Odd Numbers
number = int(input("Enter a number: "))
if number % 2 == 0:
    print("This is an even number.")
else:
    print("This is an odd number.")

#Nested If Statements
print("Welcome to the rollercoaster!")
height = int(input("What is your height in cm? "))
if height >= 120:
    print("You can ride the rollercoaster!")
    age = int(input("What is your age? "))
    if age < 12:
        print("Child tickets are $5.")
        bill = 5
    elif age <= 18:
        print("Youth tickets are $7.")
        bill = 7
    else:
        print("Adult tickets are $12.")
        bill = 12

    wants_photo = input("do you want a photo taken? y or n. ")
    if wants_photo == "y":
        bill += 3
        
    print(f"Your final bill is ${bill}.")
              
else:
    print("Sorry, you have to grow taller before you can ride.")

#Pizza Order Practice Project
print("Welcom to Python PIzza Deliveries!")
size = input("What size pizza would you like? s, m, or l: ")
bill = 0
if size == "s":
    bill += 15
elif size == "m":
    bill += 20 
else:
    bill += 25
add_pepperoni = input("Do you want pepperoni? y or n ")
if add_pepperoni == "y":
    if size == "s":
        bill += 2
    else:
        bill += 3
extra_cheese = input("Do you want extra cheese? y or n ") 
if extra_cheese == "y":
    bill += 1
print(f"Your final bill is: ${bill}")   

#Logical Operators - and, or, not
print("Welcome to the rollercoaster!")
height = int(input("What is your height in cm? "))
if height >= 120:
    print("You can ride the rollercoaster!")
    age = int(input("What is your age? "))
    if age < 12:
        print("Child tickets are $5.")
        bill = 5
    elif age <= 18:
        print("Youth tickets are $7.")
        bill = 7
    elif age >= 45 and age <= 55: # you could just use age in between instead of and operator but it this is just for demonstration purposes
        print("Everything is going to be ok. Have a free ride on us!")
    else:
        print("Adult tickets are $12.")
        bill = 12

    wants_photo = input("do you want a photo taken? y or n. ")
    if wants_photo == "y":
        bill += 3
        
    print(f"Your final bill is ${bill}.")
              
else:
    print("Sorry, you have to grow taller before you can ride.")


# day 3 project: treasure island
print("Welcome to Treasure Island.")
print("Your mission is to find the treasure.") 
choice1 = input('You\'re at a cross road. Where do you want to go? Type "left" or "right"\n').lower()
if choice1 == "left":
    choice2 = input('You\'ve come to a lake. There is an island in the middle of the lake. Type "wait" to wait for a boat. Type "swim" to swim across.\n').lower()
    if choice2 == "wait":
        choice3 = input("You arrive at the island unharmed. There is a house with 3 doors. One red, one yellow and one blue. Which colour do you choose?\n").lower()
        if choice3 == "red":
            print("It's a room full of fire. Game Over.")
        elif choice3 == "blue":
            print("You enter a room of beasts. Game Over.")
        elif choice3 == "yellow":
            print("You found the treasure! You Win!")
        else:
            print("You chose a door that doesn't exist. Game Over.")
    else:
        print("You get attacked by an angry trout. Game Over.")