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
export SCRIPTS_PATH="$HOME/dotfiles/scripts"
export HOMEBREW_PATH="/opt/homebrew/bin"
export PATH="$VOLTA_HOME:$SCRIPTS_PATH:$HOMEBREW_PATH:$PATH"
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
alias hist='history -i 0'
alias editrc="$EDITOR ~/dotfiles/.zshrc" # edit config
alias sourcerc="source ~/dotfiles/.zshrc" # reload config
alias catrc="bat ~/dotfiles/.zshrc | less" # view config
alias lo="ls -d .*" # only show hidden files

# -- quick open --
# open my personal documents repo
alias hh="echo '/Users/nathanyeung/heart-hands' | xargs nvim"
# open jupyterlab in current directory
alias studio="source .venv/bin/activate && jupyter lab --no-browser"
# open my personal data repo
alias stag="cd ~/h4ck3r/stag && source .venv/bin/activate && jupyter lab"
# open lento's application support dir
alias openl="open \
            '/Users/nathanyeung/Library/Containers/ca.failsafetech.lento/Data/Documents'"
# open peregrine's application support dir
alias openp="open \
            '/Users/nathanyeung/Library/Containers/ca.nathanyeung.peregrine/Data/Documents'"
alias loadios="open ios/Runner.xcworkspace" # open the iOS Xcode workspace for a flutter project
ee() {
    find ~/h4ck3r ~/dotfiles \
        -mindepth 1 -maxdepth 2 \
        -type d \
    | fzf --preview 'eza --tree --git-ignore {}' \
    | xargs nvim
}
cc() {
    find ~/h4ck3r ~/dotfiles \
        -mindepth 1 -maxdepth 2 \
        -type d \
    | fzf --preview 'eza --tree --git-ignore {}' \
    | xargs code
}
fp() {
    ! [ -z "$1" ] && folder="$1" || folder=.
    find "$folder" -mindepth 1 -maxdepth 2 \
    | fzf --preview 'bat {}' \
    | xargs open
}

# actions
alias fci="flutter analyze && dart format **/*.dart"
tree() {
    ! [ -z "$1" ] && folder="$1" || folder=.
    eza --tree --git-ignore -a "$folder"
}
concat-pdf() {
    pdfjam "$@" -o output.pdf
}
bvim() {
    nvim -u NONE $1
}
importtimers() {
    cd ~/h4ck3r/extensions/extensions
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
      mv "$@" ~/.Trash
}
qlk() {
    qlmanage -p "$1" > /dev/null
}
pdfify() {
    filename=$(basename "$1" | cut -d. -f1)
    pandoc "$filename".md -o "$filename".pdf --template=eisvogel
    cowsay "pdfified!" | lolcat
    open "$filename".pdf
}
vidl() {
    yt-dlp $1 --format mp4
}
m4a2mp3() {
	ffmpeg -i $1 -c:v copy -c:a libmp3lame -q:a 4 output.mp3
    cowsay "m4a converted to mp3!" | lolcat
}
ipull() {
    brctl download "$1"
}
alias listapps="osascript -e 'tell application \"System Events\" to get name of (processes where background only is false)'"
quit() {
    osascript -e 'quit app "$1"'
}

# --- init view ---
init-view() {
cat << EOF
----------------------------------------------------
🫶 Hello, $(whoami) @ $(hostname)!
$(date) || Up for $(uptime | awk -F'( |,|:)+' '{print $5"d", $7"hr", $8"min"}')
----------------------------------------------------
EOF
}
init-view
