# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/nathanyeung/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  xcode         # Xcode section
  swift         # Swift section
  battery       # Battery level and status
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_PROMPT_ADD_NEWLINE=false

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# USER DEFINED REQUIRED
export PATH="/opt/homebrew/bin:$PATH"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  . /opt/homebrew/etc/profile.d/z.sh

# USER DEFINED ALIASES/FUNCTIONS
alias editrc="nvim ~/dotfiles/.zshrc"
alias sourcerc="source ~/dotfiles/.zshrc"
alias ll="ls -la"
muse() {
  ~/tunes.rb $1
}
trashme() {
  mv $1 ~/.Trash
}
alias sleepy="pmset displaysleepnow"
qlk() {
    qlmanage -p "$1" > /dev/null
}
ipull() {
    brctl download "$1"
}
vscode() {
    open -a "Visual Studio Code" $1
}
alias darkmode="osascript ~/darkmode.scpt"
alias lightmode="osascript ~/lightmode.scpt"
entervault() {
    cd ~/OneDrive/Documents/notes-squared
    nvim .
}
alias catrc="cat ~/dotfiles/.zshrc"
alias listapps="osascript -e 'tell application "System Events" to get name of (processes where background only is false)'"
alias raidroom="open discord://discord.com/channels/382364344731828224/668869769553772574"
quit() {
    osascript -e 'quit app "$1"'
}
lo() {
    ls -d .*
}
spktim() {
    SPK=$(wc -w $1)
    SPK=${SPK//[!0-9]/}
    expr $SPK / 150
}
alias swfirefox="defaultbrowser firefoxdeveloperedition"
alias swsafari="defaultbrowser safari"
alias swvivaldi="defaultbrowser vivaldi"
alias swbrave="defaultbrowser browser"
vimr() {
	open -a VimR $1
}
alias editespanso="nvim ~/Library/Preferences/espanso/default.yml"
# Python Nerdscripts.
alias py.spacy="python3 /Users/nathanyeung/dotfiles/scripts/spacy.py"
alias py.codespaces="python3 /Users/nathanyeung/dotfiles/scripts/codespaces.py"
alias py.spktim="python3 /Users/nathanyeung/dotfiles/scripts/spktim.py"
alias py.wallpaper="python3 /Users/nathanyeung/dotfiles/scripts/wallpaper.py"
alias py.emoji="python3 /Users/nathanyeung/dotfiles/scripts/emojis.py"
py\.emoji() {
    python3 /Users/nathanyeung/h4ck3r/dotfiles/emojis.py $1
}
m4a2mp3() {
	ffmpeg -i $1 -c:v copy -c:a libmp3lame -q:a 4 output.mp3
}
alias py.wc="python3 /Users/nathanyeung/dotfiles/scripts/wc.py"
alias py.gifs="python3 /Users/nathanyeung/dotfiles/scripts/gifs.py"
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
export VISUAL=nvim
export EDITOR="$VISUAL"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

