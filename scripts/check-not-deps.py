import subprocess
from pathlib import Path

cmds = Path('test.in').read_text().split('\n')
print(cmds)

for cmd in cmds:
    raw_pkgname = cmd.split(' ')[1]
    pkgname = raw_pkgname[1:len(raw_pkgname)-1]
    res = subprocess.run(['brew', 'uses', '--installed', pkgname], capture_output=True)
    if res.stdout == b'':
        print(pkgname)
