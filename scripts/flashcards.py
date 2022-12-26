import argparse
import csv
import json
import os
import random

parser = argparse.ArgumentParser(description='Create or practice a Hypermnesia flashcard deck.')
parser.add_argument(
    '-c',
    '--create-deck',
    type=argparse.FileType('r'),
    help='Creates a Hypermnesia deck from a .csv file.',
)
parser.add_argument(
    '-r',
    '--run-deck',
    type=argparse.FileType('r'),
    help='Runs a practice session from a .hypermnesia.json file.',
)
parser.add_argument(
    '-s',
    '--scramble-deck',
    action='store_true',
    help='Scrambles the order of a deck before practicing.',
)
parser.add_argument(
    '-R',
    '--reverse-deck',
    action='store_true',
    help='Reverses the sides of the cards during practice (answers become questions and vice versa).',
)
parser.add_argument(
    '-p',
    '--partial-reverse',
    action='store_true',
    help='Same as --reverse-deck, but cards are reversed or not reversed at random throughout the deck.',
)

args = parser.parse_args()
if args.reverse_deck and args.partial_reverse:
    print('--reverse-deck (-R) and --partial-reverse (-p) cannot be used together!')
    exit()
elif args.create_deck:
    reader = csv.reader(args.create_deck)
    new_deck = {}

    for row in reader:
        new_deck[str(row[0])] = { 'answer': row[1] }

    path = args.create_deck.name[:-4] + ".hypermnesia.json"
    with open(path, "w", encoding="UTF-8") as f:
        json.dump(new_deck, f)

    print(f'Deck "{path}" created!')
elif args.run_deck:
    with open(args.run_deck.name, "r", encoding="UTF-8") as f:
        deck_data = json.load(f)

    if args.reverse_deck:
        new_deck = {}
        for k,v in deck_data.items():
            new_deck[v['answer']] = { 'answer': k }
        deck_data = new_deck
    elif args.partial_reverse:
        new_deck = {}
        for k,v in deck_data.items():
            if bool(random.getrandbits(1)):
                new_deck[v['answer']] = { 'answer': k }
            else:
                new_deck[k] = v
        deck_data = new_deck
    deck = list(deck_data.keys())
    if args.scramble_deck: random.shuffle(deck)

    for idx, card in enumerate(deck):
        os.system('clear')
        user_input = ''
        try:
            user_input = input(card + ': ')
        except KeyboardInterrupt:
            print('\nSee you soon! 👋')
            exit()
        if user_input == deck_data[card]['answer']:
            input('☑️  Correct!')
        else:
            answer = deck_data[card]['answer']
            input(f'❌ Incorrect. The correct answer is: "{answer}"')
            insert_point = random.randint(idx+1, len(deck)+1)
            deck.insert(insert_point, card)

    print(f'Practice session finished! You have mastered {args.run_deck.name[:-17]} 🎉')
