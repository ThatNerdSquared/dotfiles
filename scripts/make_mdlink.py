#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Format Link as Markdown
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔗

# Documentation:
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import clipboard
import requests
from bs4 import BeautifulSoup

urls = str(clipboard.paste()).splitlines()
result = []
for url in urls:
    page = requests.get(url)
    soup = BeautifulSoup(page.text, 'html.parser')
    title = soup.title.string
    result.append(f'[{title}]({url})')
clipboard.copy('\n'.join(result))
print("Done!")
