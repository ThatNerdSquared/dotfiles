function reviewCycle() {
    param=$1[@]
    files=("${!param}")
    for file in "${files[@]}";
    do
        eval $VIEWER_CMD "$file"

        ACTION=$(gum choose \
                    --header "What would you like to do with $file?" \
                    "Stage this file" "Discard changes" "Ignore")
        case $ACTION in
          "Stage this file") git add "$file" ;;
          "Discard changes") gum confirm "Are you sure you want to discard all changes?" && eval $DISCARD_CMD "$file" ;;
           *) ;;
        esac
    done
}

# exit if not run in a git repo
git status . > /dev/null 2>&1 || {
    gum log --structured --level error "Hmm, something went wrong. Is this a git repo?"
    exit 1
}
IFS=$'\n'

gum style --border normal --padding "0 1" "OVERVIEW"
gum style \
    --border normal \
    --margin "1 2" --padding "2 4" \
    "$(git status --porcelain .)"

gum style --border normal --padding "0 1" "Reviewing changed files..."
FILES=$(git diff --name-only)
CHOSEN=($(echo "$FILES" | \
            gum choose --no-limit \
            --header "Which changed files would you like to review?"))
#NOT_CHOSEN=$(echo ${FILES[@]} ${CHOSEN[@]} | tr ' ' '\n' | sort | uniq -u)
VIEWER_CMD="git difftool --tool=nvimdiff -y"
DISCARD_CMD="git restore"
reviewCycle CHOSEN

gum style --border normal --padding "0 1" "Reviewing untracked files..."
UNTRACKED=$(git ls-files --others --exclude-standard)
U_CHOSEN=($(echo "$UNTRACKED" | \
            gum choose \
                --no-limit \
                --header "Which untracked files would you like to review?"))
VIEWER_CMD="bat --paging=always"
DISCARD_CMD="rm"
reviewCycle U_CHOSEN

gum style \
    --border normal \
    --margin "1 2" --padding "2 4" \
    "$(git status .)"

FINAL_ACTION=$(gum choose \
                --header "What would you like to do now?" \
                "Commit" "Run again" "Exit")
case $FINAL_ACTION in
  "Commit") git commit ;;
  "Run again") exec "$0" ;;
   *) ;;
esac

gum style --border normal --padding "0 1" "🎉 Review complete!"
unset IFS
