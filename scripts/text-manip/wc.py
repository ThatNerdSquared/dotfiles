#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Word Count
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔢

# Documentation:
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import clipboard

print(len(clipboard.paste().split()))
