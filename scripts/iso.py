from datetime import datetime

raw_date = datetime.now()
formatted_date = raw_date.date().isoformat()
formatted_time = raw_date.time().isoformat(timespec='seconds')

print(formatted_date, formatted_time)
