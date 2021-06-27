import os
import nerdutils

workspaces = [
	['horace', '/Users/nathanyeung/h4ck3r/koa/horace'],
	['hyperfocus-app', '/Users/nathanyeung/h4ck3r/hyperfocus-app'],
	['scripts', '/Users/nathanyeung/dotfiles/scripts'],
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

space = nerdutils.ask('Which workspace should be opened?\n', workspaces)
selection = workspaces[space]
path = selection[1]
cmd = 'open -a \"Visual Studio Code\" ' + path

os.system(cmd)
