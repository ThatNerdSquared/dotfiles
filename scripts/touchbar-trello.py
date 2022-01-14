import requests
import tkinter as tk
import os
import dotenv
import json

dotenv.load_dotenv(override=True)
headers = {
   'Accept': 'application/json'
}

def activate():
    key = os.getenv('TRELLO_API_KEY')
    token = os.getenv('TRELLO_USER_TOKEN')
    listID = os.getenv('OPEN_COMMISSIONS_ID')

    url = 'https://api.trello.com/1/cards'
    name = 'Omega Homework'

    query = {
        'idList': listID,
        'name': name,
        'key': key,
        'token': token
    }
    response = requests.request('POST', url, headers = headers, params = query)

window = tk.Tk()
window.title('New Trello Card')

label = tk.Label(text='Name:', padx=10, pady=10)
label.pack()

inputtxt = tk.Text(window, height=5, width=20)
inputtxt.pack()

window.mainloop()
