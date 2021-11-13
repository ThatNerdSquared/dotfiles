#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title DistractyApps
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import subprocess

appNames = ['Discord', 'Microsoft Teams', 'MPU Talk']
for app in appNames:
	subprocess.Popen(f'open -a \'{app}\'', shell=True)