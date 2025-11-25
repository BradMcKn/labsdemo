#Dictionaries, Nesting and the Secret Auction Program
# programing_dictionary = {

#     "Bug": "An error in a program that prevents the program from running as expected.",
#     "Function": "A piece of code that you can easily call over and over again.",
#     "Loop": "The action of doing something over and over again.",}

# print(programing_dictionary["Bug"])

# # Adding new items to the dictionary
# programing_dictionary["List"] = "A collection of items in a particular order."
# print(programing_dictionary["List"])

#wipe an existing dictionary
# programing_dictionary = {}
# print(programing_dictionary)

# Edit an item in a dictionary
# programing_dictionary["Bug"] = "A moth in your computer."

# Loop through a dictionary
# for key in programing_dictionary:
#     print(key)
#     print(programing_dictionary[key])

#dictionary concept check
# student_scores = {
#     "Harry": 88,
#     "Ron": 78,
#     "Hermione": 95,
#     "Draco": 75,
#     "Neville": 65,
# }
# student_grades = {}
# for student in student_scores:
#     score = student_scores[student]
#     if score > 90:
#         student_grades[student] = "Outstanding"
#     elif score > 80:
#         student_grades[student] = "Exceeds Expectations"
#     elif score > 70:
#         student_grades[student] = "Acceptable"
#     else:
#         student_grades[student] = "Fail"
# print(student_grades)

#Nesting
# capitals = {
#     "France": "Paris",
#     "Germany": "Berlin"
# }

# Nested list in Dictionary

# travel_log = {
#     "France": ["Paris", "Lille", "Dijon"],
#     "Germany": ["Stuttgart", "Berlin"]
# }

# print(travel_log["France"][1])


# nested_list = ["A", "B",["C", "D"]]
# print(nested_list[2][1])

# travel_log = {
#     "France": {
#         "numm_times_visited": 8,
#         "cities_visited": ["Paris", "Lille", "Dijon"]
#     },
#     "Germany":{
#         "cities_visited": ["Berlin", "Hamburg", "Stuttgart"],
#         "total_visited": 5
#     }
# }

# print(travel_log["Germany"]["cities_visited"][2])

#auction program
print('''
                         ___________
                         \         /
                          )_______(
                          |"""""""|_.-._,.---------.,_.-._
                          |       | | |               | | ''-.
                          |       |_| |_             _| |_..-'
                          |_______| '-' `'---------'` '-'
                          )"""""""(
                        /_________\\
                        `'-------'`
''')
print("Welcome to the secret auction program.")
bids = {}
bidding_finished = False
def find_highest_bidder(bidding_record):
    highest_bid = 0
    winner = ""
    for bidder in bidding_record:
        bid_amount = bidding_record[bidder]
        if bid_amount > highest_bid:
            highest_bid = bid_amount
            winner = bidder
    print(f"The winner is {winner} with a bid of ${highest_bid}")
while not bidding_finished:
    name = input("What is your name?: ")
    price = int(input("What is your bid?: $"))
    bids[name] = price
    should_continue = input("Are there any other bidders? Type 'yes' or 'no'.\n")
    if should_continue == "no":
        bidding_finished = True
        find_highest_bidder(bids)
    elif should_continue == "yes":
        #clear the screen
        print("\n" * 100)

