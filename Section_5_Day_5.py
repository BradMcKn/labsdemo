#Python Loops

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
    
