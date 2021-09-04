import os
import tkinter as tk

def activate(space):
    path = space[0]
    os.system('osascript -e \'tell application \"iTerm\" to create window with profile \"Default\"\'')
    os.system(f'osascript -e \'tell application \"System Events\" to keystroke \"/opt/homebrew/bin/nvim -S /Users/nathanyeung/OneDrive/neovim-sessions/{path}.vim\"\'')
    os.system('osascript -e \'tell application \"System Events\" to keystroke return\'')
    window.destroy()
    return


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

window = tk.Tk()
window.title('Codespace Selection')
label = tk.Label(text='Select codespace:')
label.pack()

buttons = {}
for space in workspaces:
    def action(x = space):
        return activate(x)
    buttons[space[0]] = tk.Button(text = space[0], command = action)
    buttons[space[0]].pack()

window.mainloop()
