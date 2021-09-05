import tkinter as tk
from toggl.TogglPy import Toggl
import os
import dotenv

dotenv.load_dotenv(override=True)
auth = os.getenv("TOGGL_TOKEN")
toggl = Toggl()
toggl.setAPIKey(auth)

def activate(event):
    timer = event.widget.get(event.widget.curselection()[0])
    project_name = timers[timer].upper() + '_TOGGL_PID'
    pid = os.getenv(project_name)
    toggl.startTimeEntry(timer, pid)
    window.destroy()
    return


timers = {
    'Chill': 'Relaxation',
    'Mr. Enns': 'Class',
    'Olympiad': 'Class',
    'Harmony 10': 'Work',
    'Foundations 11': 'Work',
    'Biology': 'Work',
    'KOA': 'Dev',
    'Errands': 'Work',
    'Piano': 'Work',
    'FSL': 'Work',
}

window = tk.Tk()
window.title('Start Toggl Timer')

label = tk.Label(text='Select Toggl timer:', padx=10, pady=10)
label.pack()

list = tk.Listbox(window, selectmode = 'single')
list.bind('<<ListboxSelect>>', activate)
list.pack(padx=10, pady=10, expand=True, fill="both")

for timer in timers:
    list.insert(tk.END, timer)

window.mainloop()
