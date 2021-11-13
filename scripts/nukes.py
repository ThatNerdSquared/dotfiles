#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Launch Nukes
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🧨

# Documentation:
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import os

illegals = [
    'Discord',
    'Hollow Knight',
    'Twitch',
    'Chatterino'
]

for app in illegals:
    os.system(f'osascript -e \'quit app \"{app}\"\'');
