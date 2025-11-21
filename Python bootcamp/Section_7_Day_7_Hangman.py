import random
#Hangman game to have a cleaner type of game break it into modules examples main, art, list.
stages =  ['''
  +---+
  |   |
      |
      |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
      |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
  |   |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
 /|   |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
 /|\  |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
 /|\  |
 /    |
      |
=========''', '''
  +---+
  |   |
  O   |
 /|\  |
 / \  |
      |
=========''']

word_list = ["ardvark", "baboon", "camel"]
chosen_word = random.choice(word_list)
placeholder = ""
for position in range(len(chosen_word)):
    placeholder += "_"
print(placeholder)

lives = 6
incorrect_letter = []
correct_letter = []
game_over = False
while not game_over:
    guess = input("Guess a letter: ").lower()
    display = ""
    for letter in chosen_word:
        if letter == guess:
            display += letter
            correct_letter.append(guess)
        elif letter in correct_letter:
            display += letter
        else:
            display += "_"
    if guess not in chosen_word:
        lives -= 1
        print(f"You guessed {guess}, that's not in the word. You lose a life.")
        print(stages[6 - lives])
        incorrect_letter.append(guess)
        if lives == 0:
            game_over = True
            print("You lose.")
    print(display)

    if "_" not in display:
        game_over = True
        print("You win!")



