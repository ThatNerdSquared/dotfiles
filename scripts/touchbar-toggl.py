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
    'Humanities': 'Work',
    'Harmony 10': 'Work',
    'KOA': 'Dev',
    'Piano': 'Work',
    'FSL': 'Work',
    'French': 'Work',
    'Omega': 'Work',
    'Omega Class': 'Class',
    'Errands': 'Work',
    'Biology': 'Work',
    'Mr. Enns': 'Class',
    'Olympiad': 'Class',
    'Foundations 11': 'Work',
    'French': 'Work',
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

windowWidth = window.winfo_reqwidth()
windowHeight = window.winfo_reqheight()
positionRight = int(window.winfo_screenwidth()/2 - windowWidth/2)
positionDown = int(window.winfo_screenheight()/2 - windowHeight/2)
window.geometry(f"+{positionRight}+{positionDown}")

window.mainloop()
