#!/bin/bash

cd "${0%/*}"

# install homebrew

if ! which -s brew; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
fi

brew bundle install

# defaults

defaults write com.apple.dock autohide -bool YES                          # auto-hides dock
defaults write com.apple.dock autohide-delay -float 0                     # dock opens immediately
defaults write com.apple.dock autohide-time-modifier -float 0.2           # autohide animation speed
defaults write com.apple.dock largesize -int 75                           # set magnified size to 75
defaults write com.apple.dock magnification -bool true                    # turn magnification on
defaults write com.apple.dock showhidden -bool YES                        # dock dims hidden apps
defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES   # disable workspace-changing animation
killall Dock

# Other Mac App Store installs

mas install 937984704 # Amphetamine
mas install 1452453066 # Hidden Bar
mas install 1451685025 # WireGuard
