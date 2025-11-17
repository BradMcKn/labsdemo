#Randomisation and Python Lists

import random
import my_module

# Generate a random integer between 1 and 10 using a random module function
random_integer = random.randint(1, 10)  # This will generate a random integer between 1 and 10 (inclusive)
print(random_integer)

#if you want to create your own module you can create a new python file and import it here. example would be my_module.py
print(my_module.my_favorite_number)

random_number_0_to_1 = random.random()  # This will generate a random float between 0.0 and 1.0 you can shift the numbers around by * or + to get a different range
print(random_number_0_to_1)

random_float = random.uniform(1.0, 10.0)  # This will generate a random float between 1.0 and 10.0
print(random_float)

# practice to create a heads or tails game that prints either heads or tails randomly
coin_flip = random.choice(['Heads', 'Tails'])
print(coin_flip)

# Lists
# states of america list and fruits list
states_of_america = ['Delaware', 'Pennsylvania', 'New Jersey', 'Georgia', 'Connecticut']
states_of_america[5] = "Massachuesetts"  # This will raise an IndexError because index 5 does not exist this allows us to add to the list only if the index already exists. note if you already added to the list and re run it you'll receive a snytax error stating will raise an IndexError because index already exists.

states_of_america.append("Maryland")  # This is how you add to the end of a list and is the preferred way to add to a list .extend would let you create another list and add it to the end of this one.

#different ways to print the list
print(states_of_america[0])  # prints Delaware
print(states_of_america[2])  # prints New Jersey
print(states_of_america[-1])  # prints Maryland

fruits = ['Apple', 'Banana', 'Cherry', 'Strawberry', 'Mango']
print(fruits)

#code challenge.
#bill roulette a random person from a list of friends will pay the entire bill.
friends = ['Alice', 'Bob', 'Charlie', 'David']
print(random.choice(friends))

#indexerror out of range example
#print(states_of_america[10])  # uncomment the print statement. This will raise an IndexError because index 10 does not exist

#project Rock Paper Scissors
#rock paper scissors game
import random
# Rock Paper Scissors ASCII Art

# Rock
print("""
    _______
---'   ____)
      (_____)
      (_____)
      (____)
---.__(___)
""")

# Paper
print("""
     _______
---'    ____)____
           ______)
          _______)
         _______)
---.__________)
""")

# Scissors
print("""
    _______
---'   ____)____
          ______)
       __________)
      (____)
---.__(___)
""")

options = ['rock', 'paper', 'scissors']
user_choice = input("Enter your choice (rock, paper, scissors): ").lower()
if user_choice == 'rock':
    print("You chose Rock!")
    print("""
    _______
---'   ____)
      (_____)
      (_____)
      (____)
---.__(___)
""")
elif user_choice == 'paper':
    print("You chose Paper!")
    print("""
     _______
---'    ____)____
           ______)
          _______)
         _______)
---.__________)
""")
elif user_choice == 'scissors':
    print("You chose Scissors!")
    print("""
    _______
---'   ____)____
          ______)
       __________)
      (____)
---.__(___)
""")
computer_choice = random.choice(options)
if computer_choice == 'rock':
    print("Computer chose Rock!")
    print("""
    _______
---'   ____)
      (_____)
      (_____)
      (____)
---.__(___)
""")
elif computer_choice == 'paper':
    print("Computer chose Paper!")
    print("""
     _______
---'    ____)____
           ______)
          _______)
         _______)
---.__________)
""")
elif computer_choice == 'scissors':
    print("Computer chose Scissors!")
    print("""
    _______
---'   ____)____
          ______)
       __________)
      (____)
---.__(___)
""")
print(f"Computer chose: {computer_choice}")
if user_choice == computer_choice:
    print("It's a tie!")
elif (user_choice == 'rock' and computer_choice == 'scissors') or \
     (user_choice == 'paper' and computer_choice == 'rock') or \
     (user_choice == 'scissors' and computer_choice == 'paper'):
    print("You win!")
else:
    print("Computer wins!")
    