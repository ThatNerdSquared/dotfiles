import clipboard

input = clipboard.paste()
newText = ''

for letterNum in range(len(input)):
	if letterNum % 2:
		newText = newText + input[letterNum].upper()
	else:
		newText = newText + input[letterNum].lower()

clipboard.copy(newText)