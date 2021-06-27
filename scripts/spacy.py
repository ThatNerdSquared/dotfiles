import clipboard

text = clipboard.paste()
newText = ''

for letter in text:
    newLetter = letter + ' '
    newText = newText + newLetter

clipboard.copy(newText)

