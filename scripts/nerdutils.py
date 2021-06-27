def ask(query, optionArray):
    question = query
    i = 0

    for item in optionArray:
            text = str(i) + '| ' + item[0] + '\n'
            question = question + text
            i=i+1
    return int(input(question))
