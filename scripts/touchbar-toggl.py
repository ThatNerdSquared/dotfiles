import tkinter as tk
from toggl.TogglPy import Toggl
import os
import dotenv

dotenv.load_dotenv(override=True)
auth = os.getenv("TOGGL_TOKEN")
toggl = Toggl()
toggl.setAPIKey(auth)

def activate(timer):
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
label = tk.Label(text='Select Toggl timer:')
label.pack()

buttons = {}

for timer in timers:
    def action(x = timer):
        return activate(x)
    buttons[timer] = tk.Button(text = timer, command = action)
    buttons[timer].pack()

window.mainloop()
