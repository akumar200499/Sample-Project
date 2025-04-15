'''import random

number = int(input("Enter a number between 10 and 20 : "))

comp_number = random.randint(10,20)

if number==comp_number:
    print(f"You Win : {comp_number}")
else:
    print(f"You Lost : {comp_number}")'''

alpha = input("Enter an alphabet of your choice: ")
alphabets = "abcdefghijklmnopqrstuvwxyz"
comp_number = random.randint(0,25)
alpha = alpha.lower
comp_alphabet = alphabets[comp_number]
if alpha== comp_alphabets:
    print(f"You Win {comp_alphabet}")
else:
    print(f"You Lose {comp_alphabet}")                                                                                                                            