import os

basic_utils = [
    'brew install mas' # Install MAS apps via cli
]

art_supplies = [
    'brew install krita', # FOSS digital painting software
    'brew install blender', # 3D modeling software
    'brew install sketchbook', # Autodesk sketch software that syncs with my iPad
]

content_creation = [
    'brew install audacity', # FOSS alternative to Logic Pro
]

brew_commmands = [
    'brew install netnewswire', # RSS reader
    'brew install typora', # auto-formatting markdown editor
    'brew install balenaetcher', # GUI for creating bootable USBs
    'brew install triangula', # Converts images into images made of triangles
    'brew install arduino', # The Arduino IDE, used for school sometimes.
    'brew install amethyst', # TWM written in Swift
]

mildly_useless = [
    'brew install cleanmymac' # Utility for cleaning out cruft from mac
]

for cmd in brew_commmands:
    os.cmd(cmd)
