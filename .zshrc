# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/nathanyeung/.oh-my-zsh"
OPENSSL_ROOT_DIR="/usr/bin/openssl"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="spaceship"
source "/opt/homebrew/opt/spaceship/spaceship.zsh"
SPACESHIP_PROMPT_ORDER=(
  venv
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  dart          # Dart section
  node          # Node.js section
  xcode         # Xcode section
  swift         # Swift section
  battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_VI_MODE_COLOR=green

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
DISABLE_AUTO_UPDATE="true"

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
HIST_STAMPS="yyyy-mm-dd"

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
ulimit -n 65536
export PATH="/opt/homebrew/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  . /opt/homebrew/etc/profile.d/z.sh

# USER DEFINED ALIASES/FUNCTIONS
export BAT_THEME="Solarized (light)"
e() {
    nvim "$1"
}
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
alias catrc="cat ~/dotfiles/.zshrc | less"
alias listapps="osascript -e 'tell application "System Events" to get name of (processes where background only is false)'"
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
    cowsay "m4a converted to mp3!" | lolcat
}
alias py.wc="python3 /Users/nathanyeung/dotfiles/scripts/wc.py"
alias py.gifs="python3 /Users/nathanyeung/dotfiles/scripts/gifs.py"
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
export VISUAL=nvim
export EDITOR="$VISUAL"
alias shit="git restore ."
alias studio="source .venv/bin/activate && jupyter lab --no-browser"
alias stag="cd ~/h4ck3r/stag && source .venv/bin/activate && jupyter lab"
pirate() {
    yt-dlp $1 -x --audio-format mp3
}
vidl() {
    yt-dlp $1 --format mp4
}
pdfify() {
    filename=$(basename "$1" | cut -d. -f1)
    pandoc "$filename".md -o "$filename".pdf --template=eisvogel
    cowsay "pdfified!" | lolcat
    open "$filename".pdf
}
importtimers() {
    rm -rf timers
    cp -r ~/h4ck3r/timers-for-raycast ./timers
    cd timers/
    rm -rf .DS_Store .git/ .gitignore .vscode .idea
    cowsay "copy of timers-for-raycast imported!" | lolcat
}
bvim() {
    nvim -u NONE $1
}
alias fci="flutter analyze && dart format **/*.dart"
alias openl="open '/Users/nathanyeung/Library/Containers/ca.failsafetech.lento/Data/Documents'"
alias openp="open '/Users/nathanyeung/Library/Containers/ca.nathanyeung.peregrine/Data/Documents'"
alias loadios="open ios/Runner.xcworkspace"
alias hh="nvim ~/heart-hands"
alias ee="find ~/h4ck3r ~/dotfiles -mindepth 1 -maxdepth 2 -type d | fzf --preview 'exa --tree --git-ignore {}' | xargs nvim"
alias cc="find ~/h4ck3r ~/dotfiles -mindepth 1 -maxdepth 2 -type d | fzf --preview 'exa --tree --git-ignore {}' | xargs code"
fp() {
    find $1 -mindepth 1 -maxdepth 2 | fzf --preview 'bat {}' | xargs open
}

autoload zmv

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


bindkey -v
#eval spaceship_vi_mode_enable

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/nathanyeung/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
export PATH="/opt/homebrew/opt/python@3.11/bin:$PATH"

eval $(thefuck --alias)

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
haven --init-view
