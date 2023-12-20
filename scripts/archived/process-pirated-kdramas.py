import os
import platform
import re
import subprocess
from pathlib import Path

HOME_FOLDER = Path(str(
    os.getenv("USERPROFILE" if platform.system() == "Windows" else "HOME")
))

input_fp = HOME_FOLDER / Path('Downloads/._kdrama/business-proposal')
prefix = input('Show prefix: ')

for item in input_fp.glob('*.mp4'):
    ep_data = re.findall(r'S\d\dE\d\d', item.name)[0]
    season_num = ep_data[1:3]
    ep_num = ep_data[4:6]
    new_ep_name = f'{prefix}-s{season_num}-ep{ep_num}.mkv'

    subtitle_args = []
    map_args = []
    subtitle_stream_args = []
    map_count = 0
    for srt_file in (input_fp / Path(f'Subs/{item.stem}')).glob('*'):
        subtitle_args.append('-i')
        subtitle_args.append(str(srt_file))
        map_args.append('-map')
        map_args.append(str(map_count))
        subtitle_stream_args.append(f'-metadata:s:s:{map_count}')
        subtitle_stream_args.append(f'language={srt_file.stem[2:]}')
        map_count += 1

    ARGS = [
        'ffmpeg',
        '-i',
        str(item),
    ] + subtitle_args + map_args + [
        '-codec',
        'copy'
    ] + subtitle_stream_args
    ARGS.append(new_ep_name)

    subprocess.Popen(ARGS)

'''
subprocess.Popen(['ffmpeg', '-i'])
ffmpeg -i video.mp4 -i subtitle1.srt -i subtitle2.srt -map 0 -map 1 -map 2 \
-c copy -metadata:s:s:0 language=eng -metadata:s:s:1 language=ipk output.mkv
'''