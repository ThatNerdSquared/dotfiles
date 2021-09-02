import os

illegals = [
    'Discord',
    'Hollow Knight',
    'Twitch',
    'Chatterino'
]

for app in illegals:
    os.system(f'osascript -e \'quit app \"{app}\"\'');
