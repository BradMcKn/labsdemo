# Python functions and while loops
#how to create your own functions in python using def keyword
def greet_user():
    print("Hello!")
    print("Welcome to the program.")

greet_user()  #calling the function to execute its code

#function design
#def my_function():
    #function code block
    #more code block
    #final code block

#good practice would be to modularize code into functions for better readability and reusability

#while loops are repeatedly executed as long as a certain condition is true
def count_to_ten():
    count = 1
    while count <= 10:
        print(count)
        count += 1  #incrementing the count variable
count_to_ten()
#this function counts from 1 to 10 and prints each number
#be careful to avoid infinite loops by ensuring the loop condition will eventually be false or using break statements appropriately

