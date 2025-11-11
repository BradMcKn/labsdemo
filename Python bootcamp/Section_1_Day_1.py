#each section will be seperated by task number, this way we can see the progression of the course

#task 1 hello world
print("Hello, World!")

#task 2 String Manipulation print 3 Hello Worlds and one Hello Bootcamp
print("Hello World!\nHello World!\nHello World!")
print("Hello\nBootcamp")
print("Hello"+" "+"Bootcamp")

#task 3 Inputs
print("Hello " + input("What is your name? ") + ", welcome to the Python Bootcamp!")


#task 4 Variables
name = input("What is your name? ")
print(name)
length_of_name = len(name)
print(length_of_name)

username = input("Enter your username: ")
length_of_username = len(username)
print(length_of_username)

#example of variables and length function these two variables are not great for actual use as if you don't describe them well it can be confusing
n = "James"
L = len(n)
print(L)

#Day 1 Project: Band Name Generator
print("Welcome to the Band Name Generator.")
city = input("What's name of the city you grew up in?\n")
pet = input("What's your pet's name?\n")