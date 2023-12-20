# set up spaceship prompt
source "/opt/homebrew/opt/spaceship/spaceship.zsh"
SPACESHIP_PROMPT_ORDER=(
  venv
  user          # Username section - only shows when not login user
  dir           # Current directory section
  host          # Hostname section - only shows when SSH is active
  git           # Git section (git_branch + git_status)
  package       # Package version
  dart          # Dart section
  node          # Node.js section
  xcode         # Xcode section
  swift         # Swift section
  battery       # Battery level and status
  char          # Prompt character
)
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_PROMPT_ADD_NEWLINE=false

# PATH and other env vars
export VOLTA_HOME="$HOME/.volta"
export VOLTA_PATH="$HOME/.volta/bin"
export HOMEBREW_PATH="/opt/homebrew/bin"
export PATH="$VOLTA_HOME:$HOMEBREW_PATH:$PATH"
export OPENSSL_ROOT_DIR="/usr/bin/openssl"
export BAT_THEME="Solarized (light)"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git/"'
export VISUAL=nvim
export EDITOR="$VISUAL"

# load in some zsh goodies
autoload zmv
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# shell setup
bindkey -v # enable vim keys in zsh
# enable substring search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
setopt autocd # allow cd from just path name
. /opt/homebrew/etc/profile.d/z.sh # activate z for easier nav
ulimit -n 65536
# iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && \
    source "${HOME}/.iterm2_shell_integration.zsh"

# --- custom aliases/functions ---
# base
alias ls='ls -G' # colors by default
alias editrc="$EDITOR ~/dotfiles/.zshrc" # edit config
alias sourcerc="source ~/dotfiles/.zshrc" # reload config
alias catrc="bat ~/dotfiles/.zshrc | less" # view config
alias lo="ls -d .*" # only show hidden files

# quick open
alias hh="nvim ~/heart-hands"
alias studio="source .venv/bin/activate && jupyter lab --no-browser"
alias stag="cd ~/h4ck3r/stag && source .venv/bin/activate && jupyter lab"
alias openl="open '/Users/nathanyeung/Library/Containers/ca.failsafetech.lento/Data/Documents'"
alias openp="open '/Users/nathanyeung/Library/Containers/ca.nathanyeung.peregrine/Data/Documents'"
alias loadios="open ios/Runner.xcworkspace"
alias ee="find ~/h4ck3r ~/dotfiles -mindepth 1 -maxdepth 2 -type d | fzf --preview 'exa --tree --git-ignore {}' | xargs nvim"
alias cc="find ~/h4ck3r ~/dotfiles -mindepth 1 -maxdepth 2 -type d | fzf --preview 'exa --tree --git-ignore {}' | xargs code"
fp() {
    find $1 -mindepth 1 -maxdepth 2 | fzf --preview 'bat {}' | xargs open
}

# actions
alias fci="flutter analyze && dart format **/*.dart"
bvim() {
    nvim -u NONE $1
}
importtimers() {
    rm -rf timers
    cp -r ~/h4ck3r/timers-for-raycast ./timers
    cd timers/
    rm -rf .DS_Store .git/ .gitignore .vscode .idea
    cowsay "copy of timers-for-raycast imported!" | lolcat
}
pirate() {
    yt-dlp $1 -x --audio-format mp3
}
trashme() {
  mv $1 ~/.Trash
}
qlk() {
    qlmanage -p "$1" > /dev/null
}
ipull() {
    brctl download "$1"
}
alias listapps="osascript -e 'tell application \"System Events\" to get name of (processes where background only is false)'"
quit() {
    osascript -e 'quit app "$1"'
}
spktim() {
    SPK=$(wc -w $1)
    SPK=${SPK//[!0-9]/}
    expr $SPK / 150
}
m4a2mp3() {
	ffmpeg -i $1 -c:v copy -c:a libmp3lame -q:a 4 output.mp3
    cowsay "m4a converted to mp3!" | lolcat
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
