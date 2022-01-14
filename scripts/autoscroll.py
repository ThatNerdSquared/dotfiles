import os
import time

for x in range(5000):
    os.system(f'osascript -e \'tell application \"System Events\" to keystroke (key code 125)\'')
    time.sleep(3)
