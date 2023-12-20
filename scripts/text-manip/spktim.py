#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Speaking Time
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🗣

# Documentation:
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import clipboard

text = clipboard.paste()
wordNum = len(text.split())
spktim = wordNum / 150

print(spktim)
