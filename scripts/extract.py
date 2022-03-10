import os
import sys

input = list(sys.stdin)
for item in input:
    os.system(f'echo {item.rstrip()} | python3 extract-mpu-to-obsidian.py')
