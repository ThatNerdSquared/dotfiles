import argparse
from datetime import datetime
import clipboard
import json
from pathlib import Path

parser = argparse.ArgumentParser(description='Illegally import items into Peregrine.')
parser.add_argument(
    '-p',
    '--payload',
    type=argparse.FileType('r'),
    help='Loads a formatted markdown file with entries to be imported.',
)
parser.add_argument(
    '-t',
    '--tag',
    type=str,
    help='Add a tag to all items.',
)
parser.add_argument(
    '-e',
    '--exempt-date',
    action='store_true',
    help='Exempt the date.',
)

items = json.loads(Path("/Users/nathanyeung/peregrinelog.json").read_text())

args = parser.parse_args()
if args.payload:
    try:
        raw_payloadfile = Path(args.payload.name).read_text()
    except:
        print("No payload given!")
        exit()

parsed_payloads = []
raw_payloads = raw_payloadfile.split("%@%\n")
for rpayload in raw_payloads:
    spl = rpayload.splitlines()
    if args.exempt_date:
        date = datetime.now().isoformat()
    else:
        date = spl[0]
        spl.pop(0)
    if args.tag:
        spl.append(f"#{args.tag}")
    user_input = "\n".join(spl)
    parsed_payloads.append({
        "date": date,
        "input": user_input,
        "encrypted": False,
        "tags": []
    })

hackeditems = items + parsed_payloads

final_log = sorted(hackeditems, key=lambda x: x['date']) 
clipboard.copy(json.dumps(final_log, indent=4))
print(f"{len(parsed_payloads)} entries illegally imported!")