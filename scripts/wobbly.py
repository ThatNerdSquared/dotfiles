#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Wobbly
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 📈

# Documentation:
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import clipboard

input = clipboard.paste()
newText = ''

for letterNum in range(len(input)):
	if letterNum % 2:
		newText = newText + input[letterNum].upper()
	else:
		newText = newText + input[letterNum].lower()

clipboard.copy(newText)