import tkinter as tk
import requests
import os
import dotenv
import json

dotenv.load_dotenv(override=True)

headers = {'content-type': 'application/json'}
auth = os.getenv("TOGGL_TOKEN")

def get_project_id(project_name):
    workspace_api = 'https://api.track.toggl.com/api/v8/workspaces'
    r = requests.get(url = workspace_api, headers = headers, auth = auth)
    data = json.loads(r.json())
    print(data)

def activate(timer):
    url = 'https://api.track.toggl.com/api/v8/time_entries/start'

    data = {
        "time_entry":{
            "description":timer,
            "pid":123,
            "created_with":"touchbar-toggl"
        }
    }


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
    get_project_id('poggers')

window.mainloop()

