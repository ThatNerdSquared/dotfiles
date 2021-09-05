import os
import tkinter as tk

def activate(event):
    space = event.widget.get(event.widget.curselection()[0])
    path = workspaces[space]
    os.system('osascript -e \'tell application \"iTerm\" to create window with profile \"Default\"\'')
    os.system(f'osascript -e \'tell application \"System Events\" to keystroke \"nvim {path} -S /Users/nathanyeung/OneDrive/neovim-sessions/{space}.vim\"\'')
    os.system('osascript -e \'tell application \"System Events\" to keystroke return\'')
    window.destroy()
    return


workspaces = {
	'horace': '/Users/nathanyeung/h4ck3r/koa/horace',
	'hyperfocus-app': '/Users/nathanyeung/h4ck3r/hyperfocus-app',
	'scripts': '/Users/nathanyeung/dotfiles/scripts',
	'xmaets-bot': '/Users/nathanyeung/h4ck3r/xmaets-bot',
	'widgets': '/Users/nathanyeung/Library/Application Support/Übersicht/widgets',
	'tutorial-app': '/Users/nathanyeung/h4ck3r/tutorial-app',
	'advent-of-code-2020': '/Users/nathanyeung/h4ck3r/advent-of-code-2020',
	'pom-bot': '/Users/nathanyeung/h4ck3r/pom-bot',
	'expressjs-tutorial': '/Users/nathanyeung/h4ck3r/expressjs-tutorial',
	'public-code': '/Users/nathanyeung/h4ck3r/public-code',
	'steamx-git': '/Users/nathanyeung/OneDrive/Documents/steamx-git',
	'zeus-bot': '/Users/nathanyeung/h4ck3r/zeus-bot',
}

window = tk.Tk()
window.title('Codespace Selection')

label = tk.Label(text='Select codespace:')
label.pack()

list = tk.Listbox(window, selectmode = 'single')
list.bind('<<ListboxSelect>>', activate)
list.pack(padx=10, pady=10, expand=True, fill="both")

for space in workspaces:
    list.insert(tk.END, space)

windowWidth = window.winfo_reqwidth()
windowHeight = window.winfo_reqheight()
positionRight = int(window.winfo_screenwidth()/2 - windowWidth/2)
positionDown = int(window.winfo_screenheight()/2 - windowHeight/2)
window.geometry(f"+{positionRight}+{positionDown}")

window.mainloop()
