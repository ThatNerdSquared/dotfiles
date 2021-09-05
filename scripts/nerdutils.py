from subprocess import Popen, PIPE

def ask(query, optionArray):
    question = query
    i = 0

    for item in optionArray:
            text = str(i) + '| ' + item[0] + '\n'
            question = question + text
            i=i+1
    return int(input(question))

def applescript_prompt(choices):
    list = ''
    for item in choices:
        if item == choices[len(choices)-1]:
            list = list + '\"' + item + '\"'
        else:
            list = list + '\"' + item + '\",'
    cmd = 'osascript -e \'choose from list {' + list + '} with prompt \"Start Toggl Timer:\" without multiple selections allowed and empty selection allowed\''
    print(cmd)

    stdout = Popen(cmd, shell=True, stdout=PIPE).stdout
    output = stdout.read()
    answer = output[:-1].decode('utf-8')

    return answer
