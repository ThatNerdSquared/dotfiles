#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Powershell
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🔷
#
# Documentation:
# @raycast.description Open a PowerShell profile in iTerm.
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import os

cmd = """tell application \\\"iTerm\\\"
    create window with profile \\\"Powershell\\\"
    activate
end tell"""

os.system(f"osascript -e \"{cmd}\"")
print("PowerShell window created!")
