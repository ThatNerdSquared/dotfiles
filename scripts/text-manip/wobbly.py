#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Wobbly
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📈

# Documentation:
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import subprocess

input = subprocess.run(
    'pbpaste',
    shell=True,
    text=True,
    capture_output=True
).stdout.strip()

newText = ''

for letterNum in range(len(input)):
	if letterNum % 2:
		newText += input[letterNum].upper()
	else:
		newText += input[letterNum].lower()

subprocess.run(f'echo "{newText}" | pbcopy', shell=True)
