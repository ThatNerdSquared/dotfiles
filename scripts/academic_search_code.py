#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Academic Search Code
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🔎
# @raycast.argument1 { "type": "text", "placeholder": "Project Code", "optional": false}
#
# Documentation:
# @raycast.description Quick copy academic search code for a project.
# @raycast.author ThatNerdSquared
# @raycast.authorURL https://github.com/ThatNerdSquared

import clipboard
import json
import sys

with open("/Users/nathanyeung/dotfiles/academic_search_codes.json", "r", encoding="UTF-8") as search_codes:
    data = json.load(search_codes)

data[sys.argv[1]] += 1
clipboard.copy(f"`{sys.argv[1]}{str(data[sys.argv[1]]).zfill(3)}`")

with open("/Users/nathanyeung/dotfiles/academic_search_codes.json", "w", encoding="UTF-8") as search_codes:
    json.dump(data, search_codes)
