import clipboard

text = clipboard.paste()

wordNum = len(text.split())

spktim = wordNum / 150

print(spktim)
