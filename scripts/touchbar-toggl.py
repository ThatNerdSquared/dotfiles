import tkinter as tk
from toggl.TogglPy import Toggl
import os
import dotenv
import nerdutils

dotenv.load_dotenv(override=True)
auth = os.getenv("TOGGL_TOKEN")
toggl = Toggl()
toggl.setAPIKey(auth)

def activate(timer):
    print(timer)
    project_name = timers[timer].upper() + '_TOGGL_PID'
    pid = os.getenv(project_name)
    toggl.startTimeEntry(timer, pid)


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
}

buttons = []
for timer in timers:
    buttons.append(timer)

answer = nerdutils.applescript_prompt(buttons)
print(answer)

activate(answer)
