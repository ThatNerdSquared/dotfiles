import clipboard
import emoji
import markdownify
import re
import requests
import sys
from datetime import datetime
from bs4 import BeautifulSoup

#################################
MARKDOWN_FILE_PATH = '/Users/nathanyeung/OneDrive/Documents/notes-squared/mpu-talk-posts.md'
YOUR_USERNAME = 'ThatNerd'
#################################

if sys.stdin != None:
    url = list(sys.stdin)[0].rstrip()
else:
    url = str(clipboard.paste())
url_parts = url.split('/')

try:
    post_number = int(url_parts[-1].split('?')[0])
    thread = requests.get(url)
except:
    raise Exception('URL not valid or internet connection not found!')

soup = BeautifulSoup(thread.text, 'html.parser')

post_to_extract = None
post_metadata = None
posts = soup.find_all('div', class_="topic-body crawler-post", itemtype="http://schema.org/DiscussionForumPosting")
for post in posts:
    post_info = post.div.find('span', class_="crawler-post-infos")
    if post_info.span.string == f"#{post_number}":
        post_to_extract = post
        post_metadata = post_info

title = str(soup.head.title.string).split('-')[0][:-1]
date_and_time = datetime.strptime(post_metadata.time['datetime'], "%Y-%m-%dT%H:%M:%SZ")
author = post_to_extract.div.span.a.span.string
if author == YOUR_USERNAME:
    author = "**You**"
author_profile = post_to_extract.div.span.a['href']
body = post_to_extract.find_all('div', class_="post", itemprop="articleBody")[0]
mdbody = markdownify.markdownify(str(body)).split('\n')[1:-1]
mdbody_processed = []

for idx, item in enumerate(mdbody):
    if item == '':
        if mdbody[idx+1] == '': mdbody.pop(idx+1)
    if ':](https://talk.macpowerusers.com/images/emoji/apple/' in item:
        emotes = re.findall(r'\[\:\w*\:\]', item)
        for emote in emotes:
            emoji_url = f'!{emote}(https://talk.macpowerusers.com/images/emoji/apple/{emote[2:-2]}.png?v=9 "{emote[1:-1]}")'
            item = emoji.emojize(item.replace(emoji_url, emote[1:-1]), use_aliases=True).replace(':slight_smile:', '🙂')
    if idx == 0:
        mdbody_processed.append(item.rstrip())
    else:
        mdbody_processed.append("        > " + item.rstrip())

final_body = "\n".join(mdbody_processed)
final_body = final_body[:final_body.rfind('\n')]

text = f"""- [@{author}]({author_profile}) on [{title}]({url}), at {date_and_time.date()}, {date_and_time.time()}:
    - > {final_body}
"""

if MARKDOWN_FILE_PATH != '':
    file = open(MARKDOWN_FILE_PATH, 'a')
    file.write('\n')
    file.write(text)
    file.close()
else:
    clipboard.copy(text)
