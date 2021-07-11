import os

basic_utils = [
    'brew install mas' # Install MAS apps via cli
    'brew install gh' # Github CLI
]

dev_toolchains = [
    'brew install nodejs',
    'brew install npm',
    'brew install go',
]

dotfile_deploy = [
    'ln -sv "/Users/nathanyeung/dotfiles/.zshrc" ~'
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
    'brew install vimr' # neovim GUI
    'brew install balenaetcher', # GUI for creating bootable USBs
    'brew install triangula', # Converts images into images made of triangles
    'brew install arduino', # The Arduino IDE, used for school sometimes.
    'brew install amethyst', # TWM written in Swift
    'brew install rectangle' # Window rearranging software, like an OSS Magnet
]

mildly_useless = [
    'brew install cleanmymac' # Utility for cleaning out cruft from mac
]

for cmd in brew_commmands:
    os.cmd(cmd)
