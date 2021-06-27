import nerdutils
import clipboard
import sys

emotes = [
        [':cjoy:', 'https://cdn.discordapp.com/emojis/709811770264387665.png?size=64'],
        [':hug:', 'https://cdn.discordapp.com/emojis/654337058923610133.png?size=64'],
        [':kittysmile:', 'https://cdn.discordapp.com/emojis/821846594064220190.png?size=64'],
        [':csmile:', 'https://cdn.discordapp.com/emojis/710211363640705045.png?size=64'],
        [':yes:', 'https://cdn.discordapp.com/emojis/562072692086276118.png?size=64'],
        [':blurry_eyes:', 'https://cdn.discordapp.com/emojis/751962882908094546.png?size=64'],
        [':mmtea:', 'https://cdn.discordapp.com/emojis/585828753373003787.png?size=64'],
        [':travelerBruh:', 'https://cdn.discordapp.com/emojis/854093158384402483.png?size=64'],
        [':fancythink:', 'https://cdn.discordapp.com/emojis/588732963127164956.png?size=64'],
        [':joystroke:', 'https://cdn.discordapp.com/emojis/830592461315375146.png?size=64'],
        [':chongyunCool:', 'https://cdn.discordapp.com/emojis/855157324041551923.png?size=64'],
        [':chongyunShock:', 'https://cdn.discordapp.com/emojis/855159654241271848.png?size=64'],
        [':chongyunSad:', 'https://cdn.discordapp.com/emojis/855161416951791627.png?size=64'],
        [':elixir:', 'https://cdn.discordapp.com/emojis/856335287926915092.png?size=64']
]

if len(sys.argv) == 2:
    emoteNum = int(sys.argv[1])
    selection = emotes[emoteNum]
    emoji = selection[1]
    print(emoji)
else:
    emote = nerdutils.ask('Which emote should be copied?\n', emotes)
    selection = emotes[emote]
    emoji = selection[1]

    clipboard.copy(emoji)
