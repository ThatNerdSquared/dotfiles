import argparse
import os
import time

parser = argparse.ArgumentParser(description='Autoscroll in a given direction. macOS only.')
parser.add_argument(
    '-i',
    '--interval',
    type=int,
    help='Interval between scrolls.',
)
parser.add_argument(
    '-d',
    '--down',
    action='store_true',
    help='Autoscroll downward.',
)
parser.add_argument(
    '-u',
    '--up',
    action='store_true',
    help='Autoscroll upward.',
)
parser.add_argument(
    '-l',
    '--left',
    action='store_true',
    help='Autoscroll left.',
)
parser.add_argument(
    '-r',
    '--right',
    action='store_true',
    help='Autoscroll right.',
)

args = parser.parse_args()

KEY_CODES = {
  'up': '126',
  'down': '125',
  'left': '123',
  'right': '124',
};

def scrollcmd(key):
    for x in range(5000):
        os.system(f'osascript -e \'tell application \"System Events\" to keystroke (key code {KEY_CODES[key]})\'')
        time.sleep(3)

if args.up:
    scrollcmd('up')
elif args.down:
    scrollcmd('down')
elif args.left:
    scrollcmd('left')
elif args.right:
    scrollcmd('right')
