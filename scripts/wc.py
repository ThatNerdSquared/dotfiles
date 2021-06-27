import clipboard

text = clipboard.paste()

wordNum = len(text.split())

print(wordNum)
