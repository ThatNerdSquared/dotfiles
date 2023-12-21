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

import subprocess

text = subprocess.run(
    'pbpaste',
    shell=True,
    text=True,
    capture_output=True
).stdout.strip().split()
spktim = len(text) / 150
print(spktim)
