import os

workspaces = [
	['horace', '/Users/nathanyeung/h4ck3r/koa/horace'],
	['hyperfocus-app', '/Users/nathanyeung/h4ck3r/hyperfocus-app'],
	['scripts', '/Users/nathanyeung/h4ck3r/scripts'],
	['xmaets-bot', '/Users/nathanyeung/h4ck3r/xmaets-bot'],
	['widgets', '/Users/nathanyeung/Library/Application Support/Übersicht/widgets'],
	['tutorial-app', '/Users/nathanyeung/h4ck3r/tutorial-app'],
	['advent-of-code-2020', '/Users/nathanyeung/h4ck3r/advent-of-code-2020'],
	['pom-bot', '/Users/nathanyeung/h4ck3r/pom-bot'],
	['expressjs-tutorial', '/Users/nathanyeung/h4ck3r/expressjs-tutorial'],
	['public-code', '/Users/nathanyeung/h4ck3r/public-code'],
	['steamx-git', '/Users/nathanyeung/OneDrive/Documents/steamx-git'],
	['zeus-bot', '/Users/nathanyeung/h4ck3r/zeus-bot']
]

question = 'Which workspace should be opened?\n'
i = 0

for item in workspaces:
	text = str(i) + '| ' + item[0] + '\n'
	question = question + text
	i=i+1

space = int(input(question))
selection = workspaces[space]
path = selection[1]
cmd = 'open -a \"Visual Studio Code\" ' + path

os.system(cmd)