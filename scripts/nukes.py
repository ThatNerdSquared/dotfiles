#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Launch Nukes
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🧨

# Documentation:
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import os

illegals = [
    'IINA',
    'SUPERHOT',
    'Discord',
    'Into the Breach',
    'GRIS',
    'Slack',
    'Hollow Knight',
    'Twitch',
    'Chatterino'
    'MPU Talk'
]

for app in illegals:
    os.system(f'osascript -e \'quit app \"{app}\"\'')

print('Nuke launched successfully')
