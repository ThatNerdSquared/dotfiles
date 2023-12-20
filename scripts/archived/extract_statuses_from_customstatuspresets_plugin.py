import json
import os
import platform
from pathlib import Path

HOME_FOLDER = Path(str(
    os.getenv("USERPROFILE" if platform.system() == "Windows" else "HOME")
))

fp = HOME_FOLDER / Path('Library/Application Support/BetterDiscord/plugins/CustomStatusPresets.config.json')
data = json.loads(fp.read_text())

presets = data['all']['presets']
full_statuses = []
for itemkey in presets.keys():
    item = presets[itemkey]
    status = item['text']
    try:
        emote = item['emojiInfo']['name']
        full_statuses.append(f'{emote} {status}')
    except KeyError:
        full_statuses.append(status)

saved_fp = Path('extracted_statuses.txt')
saved_fp.write_text('\n'.join(full_statuses))
print(f'🎉 {len(full_statuses)} statuses extracted successfully!')
