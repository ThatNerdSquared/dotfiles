# prompt
set -o PROMPT_SUBST
function nerdprompt() {
    venv_prompt=$([ "$VIRTUAL_ENV" ] && echo "v:$(basename $(dirname "$VIRTUAL_ENV"))|")
    conda_prompt=$([ "$CONDA_PREFIX" ] && echo "c:$(basename "$CONDA_PREFIX")")
    git_branch=$(git -C $(pwd) branch --show-current 2>/dev/null)
    is_dirty=$([ "$(git status --porcelain $(pwd) 2>/dev/null)" ] && echo "*")
    echo %B%F{green}$venv_prompt$conda_prompt\ %f%F{cyan}%3~/%f\ %F{blue}"b:$git_branch$is_dirty"%f%b\ \—\>\ 
}
PS1="\$(nerdprompt)"

# PATH and other env vars
export VOLTA_HOME="$HOME/.volta"
export VOLTA_PATH="$HOME/.volta/bin"
export SCRIPTS_PATH="$HOME/dotfiles/scripts"
export HOMEBREW_PATH="/opt/homebrew/bin"
# add volta installation, scripts, and homebrew to PATH
export PATH="$VOLTA_HOME:$SCRIPTS_PATH:$HOMEBREW_PATH:$PATH"
export OPENSSL_ROOT_DIR="/usr/bin/openssl"
export BAT_THEME="Solarized (light)"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git/"'
export VISUAL=nvim
export EDITOR="$VISUAL"
VIRTUAL_ENV_DISABLE_PROMPT='true'

# load in some zsh goodies
autoload zmv
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# shell setup
bindkey -v # enable vim keys in zsh
setopt inc_append_history # add history immediately instead of at session end
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
scr() { # quickly execute a script in my scripts dir
    find ~/dotfiles/scripts \
        -mindepth 1 -maxdepth 2 \
        -type file -exec basename {} \; \
    | choose \
    | sh
}
ytwl() {
    rg -F '[ ]' ~/heart-hands/02.lists/media-consumption-waitlist.md \
        | fzf \
        | sed 's/.*[\(]//g' \
        | sed 's/)//' \
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
alias fmtjson="pbpaste | xargs | python3 -m json.tool | pbcopy"
alias wco="pbpaste | xargs | wc -w"
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
    yt-dlp -x --audio-format mp3 "$1"
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
exec-in-new-iterm-tab() {
    osascript &>/dev/null <<EOF
      tell application "iTerm"
        activate
        tell current window to set tb to create tab with default profile
        tell current session of current window to write text "cd \"$2\" && \"$1\" && exit"
      end tell
EOF
}

# --- init view ---
init-view() {
cat << EOF
----------------------------------------------------
🫶 Hello, $(whoami) @ $(hostname)!
$(date) || Up for $(uptime | awk -F'( |,)+' '{print $4"d "$6 }')
----------------------------------------------------
EOF
}
init-view

info-view() {
column -ts $'\t' << EOF
dart: $(dart --version | awk -F' ' '{print $4}')	$(which dart)
python3: $(python3 -V | sed "s/Python //")	$(which python3)
nodejs: $(node -v | sed "s/v//")	$(which node)
typescript: $(tsc -v | sed "s/Version //")	$(which tsc)
rust: $(rustc -V | awk -F' ' '{print $2}')	$(which rustc)
r: $(R --version | head -1 | awk -F' ' '{print $3}')	$(which R)
go: $(go version | awk -F'( |go)+' '{print $3}')	$(which go)
EOF
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
