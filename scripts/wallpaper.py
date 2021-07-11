import os

picsFolder = '/Users/nathanyeung/DesktopPics/'
wallpapers = [
	['study1', 'study3.jpg'],
	['UBC IKB Library', '29468450274_8e6abda8b4_o.jpg'],
	['UBC Martha Piper Plaza', '20089915475_1cd74fac37_o.jpg'],
	['UBC Koerner Library', '20089915295_2b8efb1dc2_o.jpg'],
	['Leo and Zephyr', 'leo-and-zephyr.png'],
        ['UBC Main Mall', '47954308962_5a79df32ed_o.jpg'],
        ['Milk and Mocha', 'Bearie.png'],
        ['Albert Einstein Quote', 'albert-eintstein-library.jpeg'],
        ['Elixir', 'elixir-nerd-wallpaper.png'],
        ['ThatNerded', 'thatnerdWallpaper.png'],
        ['ThatNerded Colour', 'thatNerdColour.png']
]

question = 'Which wallpaper should be set?\n'
i = 0

for item in wallpapers:
	text = str(i) + '| ' + item[0] + '\n'
	question = question + text
	i=i+1

image = int(input(question))
selection = wallpapers[image]
path = picsFolder + selection[1]

cmd = 'osascript -e \'tell application "Finder"\' -e \'set desktop picture to POSIX file "%s"\' -e \'end tell\'' % path

os.system(cmd)
