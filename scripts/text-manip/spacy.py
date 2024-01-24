#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Spacy
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🪐

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
newText = (' '.join(input))
subprocess.run(f'printf %s "{newText}" | pbcopy', shell=True)
