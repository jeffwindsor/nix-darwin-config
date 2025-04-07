#!/usr/bin/env bash

brew_command="${1:-install}"  # reinstall, info, etc..

# install brew if missing
if ! command -v brew &> /dev/null; then
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Standard GUI Apps
brew $brew_command --cask nikitabobko/tap/aerospace  #i3 like tiling
brew $brew_command --cask balenaetcher     # usb iso app 
brew $brew_command --cask chatgpt
brew $brew_command --cask firefox
brew $brew_command --cask ghostty
brew $brew_command --cask google-chrome
brew $brew_command --cask jordanbaird-ice  # bar icon manager
brew $brew_command --cask keepingyouawake
brew $brew_command --cask zed
brew $brew_command --cask zen-browser

if [[ $(hostname) == "Midnight-Air.local" ]]; then
  brew $brew_command --cask chatgpt
  brew $brew_command --cask iina
  brew $brew_command --cask spotify
  # brew $brew_command --cask sweet-home3d
fi


if [[ $(hostname) == "work" ]]; then
  brew $brew_command --cask intellij-idea
fi
