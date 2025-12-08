# blackjack project

import random

print("""
 _     _            _    _            _    
| |   | |          | |  (_)          | |   
| |__ | | __ _  ___| | ___  __ _  ___| | __
| '_ \| |/ _` |/ __| |/ / |/ _` |/ __| |/ /
| |_) | | (_| | (__|   <| | (_| | (__|   < 
|_.__/|_|\__,_|\___|_|\_\ |\__,_|\___|_|\_\
                       _/ |                
                      |__/     
""")

name = input("What is your name? ")

print(f"Welcome {name} to Python Casino and the Blackjack game!")

player_cash = int(input("How much would you like to start with in cash?: $"))

print(f"You are starting with ${player_cash}! Good luck!")

# Card values
playing_cards = {
    "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7,
    "8": 8, "9": 9, "10": 10,
    "J": 10, "Q": 10, "K": 10,
    "A": 11
}

# Build and shuffle the deck
deck = list(playing_cards.keys()) * 4
random.shuffle(deck)


def deal_card():
    return deck.pop()


def calculate_score(hand):
    score = sum(playing_cards[card] for card in hand)
    aces = hand.count("A")

    # If score is over 21, treat some Aces as 1 instead of 11
    while score > 21 and aces > 0:
        score -= 10
        aces -= 1

    return score


def blackjack():
    global player_cash, deck

    # Reshuffle if the deck is getting low
    if len(deck) < 15:
        deck = list(playing_cards.keys()) * 4
        random.shuffle(deck)
        print("\nReshuffling the deck...\n")

    player_hand = []
    dealer_hand = []

    # Ask for bet
    while True:
        try:
            bet = int(input(f"\nYou have ${player_cash}. How much would you like to bet?: $"))
            if bet > player_cash:
                print("You cannot bet more than you have!")
            elif bet <= 0:
                print("Bet must be greater than zero.")
            else:
                break
        except ValueError:
            print("Please enter a valid amount.")

    # Initial deal
    for _ in range(2):
        player_hand.append(deal_card())
        dealer_hand.append(deal_card())

    game_over = False

    while not game_over:
        player_score = calculate_score(player_hand)
        dealer_score = calculate_score(dealer_hand)

        print(f"\nYour cards: {player_hand}, current score: {player_score}")
        print(f"Dealer's first card: {dealer_hand[0]}")

        if player_score == 21:
            print("Blackjack! You win!")
            # Blackjack payout: win 1.5x your bet (profit)
            player_cash += int(1.5 * bet)
            return
        elif player_score > 21:
            print("You went over 21! You lose.")
            player_cash -= bet
            return

        should_continue = input("Type 'y' to get another card, type 'n' to pass: ").lower()
        if should_continue == 'y':
            player_hand.append(deal_card())
        else:
            game_over = True

    # Dealer's turn
    dealer_score = calculate_score(dealer_hand)
    while dealer_score < 17:
        dealer_hand.append(deal_card())
        dealer_score = calculate_score(dealer_hand)

    print(f"\nYour final hand: {player_hand}, final score: {player_score}")
    print(f"Dealer's final hand: {dealer_hand}, final score: {dealer_score}")

    if dealer_score > 21 or player_score > dealer_score:
        print("You win!")
        player_cash += bet
    elif player_score < dealer_score:
        print("You lose.")
        player_cash -= bet
    else:
        print("Push. It is a tie. Your bet is returned.")


# Main game loop: ask if they want to play another hand
while player_cash > 0:
    blackjack()

    if player_cash <= 0:
        print("\nYou are out of money! Game over!")
        break

    again = input("\nDo you want to play another hand? (y/n): ").lower()
    if again != "y":
        print(f"\nYou leave the table with ${player_cash}. Thanks for playing, {name}!")
        break

if player_cash <= 0:
    print(f"\nBetter luck next time, {name}!")
