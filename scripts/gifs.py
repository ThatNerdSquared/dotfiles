import clipboard

gifs = [
        ['\'\'dilucfail', 'https://tenor.com/view/val-genshin-impact-diluc-destination-of-fate-gif-21305592']
        ['\'\'raid', 'https://tenor.com/view/once-breach-fight-gif-18135810']
]

question = 'Which GIF should be copied?\n'
i = 0

for item in gifs:
	text = str(i) + '| ' + item[0] + '\n'
	question = question + text
	i=i+1

gif = int(input(question))
selection = gifs[gif]
link = selection[1]

clipboard.copy(gif)
