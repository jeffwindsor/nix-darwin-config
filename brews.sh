#!/usr/bin/env bash

# install brew if missing
if ! command -v brew &> /dev/null; then
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install apps
brew reinstall --cask jordanbaird-ice  # bar icon manager
brew reinstall --cask keepingyouawake  # like caffiene
brew reinstall --cask zen-browser      # browser not in nix package store as of 2025-03-21
brew reinstall --cask ghostty          # currently broken package in nix as of 2025-03-17
brew reinstall --cask balenaetcher     # usb iso app 

