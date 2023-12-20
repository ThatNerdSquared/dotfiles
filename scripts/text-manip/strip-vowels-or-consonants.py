import argparse

VOWELS = ['a', 'e', 'i', 'o', 'u']

parser = argparse.ArgumentParser()
parser.add_argument(
    '-i',
    '--user-input',
    type=str
)
parser.add_argument(
    '-v',
    '--no-vowels',
    action='store_true'
)
parser.add_argument(
    '-c',
    '--no-consonants',
    action='store_true'
)
args = parser.parse_args()
if args.no_vowels:
    print(''.join([x for x in args.user_input if x not in VOWELS]))
elif args.no_consonants:
    print(''.join([x for x in args.user_input if x in VOWELS]))
