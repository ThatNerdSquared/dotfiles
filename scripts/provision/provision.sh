echoDate() {
    echo -n "Currently "
    date
}

cat << EOF
provision.sh 2.0
Last updated 2023-12-11 by @ThatNerdSquared
$(echoDate)
EOF

# Start timer.
date1=$(date +"%s")


cat << EOF
----------------------
📦 installing tools...
----------------------
EOF
echo "🛠️ installing xcode cli tools..."
xcode-select --install

# this has to come after installing the xcode cli tools, as homebrew's install
# script relies on components that come with the xcode tools, such as git.
echo "🍺 installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "🧐 cloning dotfiles..."
git clone git@github.com:ThatNerdSquared/dotfiles.git ~/dotfiles

echo "🚀 installing tools from homebrew..."
brew bundle install --file=~/dotfiles/Brewfile

echo "🔋 installing latest node using volta..."
volta install node@latest

#curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

cat << EOF
----------------------------------
💡 You may want to call
provision/deploy-dotfiles-macos.sh
to link your dotfiles.
----------------------------------
EOF

cat << EOF
----------------------------------
🫶 configuring macos just right...
----------------------------------
EOF
# put dock on left, autohide, no recents
defaults write com.apple.dock "orientation" -string "left" && killall Dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock

# finder: show extensions, hidden files, path bar,
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder

# menubar 24 hr time
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""

# prevent macOS from randomly rearranging spaces (why is that even default behaviour?)
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock
# separate spaces per display
defaults write com.apple.spaces "spans-displays" -bool "true" && killall SystemUIServer

# keyboard settings: prevent autocaps
defaults write NSGlobalDomain "NSAutomaticCapitalizationEnabled" -bool "false"

# fix font rendering in alacritty
# credit: https://github.com/alacritty/alacritty/issues/7333
defaults write org.alacritty AppleFontSmoothing -int 0


cat << EOF
-------------------------------
🎉 your machine is ready to go!
-------------------------------
EOF
echoDate

date2=$(date +"%s")
DIFF=$(($date2-$date1))
echo "provision.sh run time: $(($DIFF / 3600 )) hours $((($DIFF % 3600) / 60)) minutes $(($DIFF % 60)) seconds"
