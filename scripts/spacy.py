#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Spacy
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🪐

# Documentation:
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import clipboard

text = clipboard.paste()
newText = ''

for letter in text:
    newLetter = letter + ' '
    newText = newText + newLetter

clipboard.copy(newText)

