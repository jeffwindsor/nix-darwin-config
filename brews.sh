#!/usr/bin/env bash

brew_command="${1:-install}"

# install brew if missing
if ! command -v brew &> /dev/null; then
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install apps
brew $brew_command --cask jordanbaird-ice  # bar icon manager
brew $brew_command --cask keepingyouawake  # like caffiene
brew $brew_command --cask zen-browser      # browser not in nix package store as of 2025-03-21
brew $brew_command --cask ghostty          # currently broken package in nix as of 2025-03-17
brew $brew_command --cask balenaetcher     # usb iso app 

