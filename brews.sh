#!/usr/bin/env bash

brew_command="${1:-install}"  # reinstall, info, etc..
function cask-install(){
  echo -e "\e[94m==> Brew Install $1 <==\e[0m"
  brew $brew_command --cask "$1"
}

# install brew if missing
if ! command -v brew &> /dev/null; then
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Standard GUI Apps
CASKS=(
  balenaetcher     # usb iso app 
  chatgpt
  firefox
  ghostty
  google-chrome
  jordanbaird-ice  # bar icon manager
  keepingyouawake
  nikitabobko/tap/aerospace  #i3 like tiling
  sweet-home3d
  zed
  zen-browser
)

# machine specific packages
machine=$(networksetup -getcomputername)
if [[ $machine == "Midnight-Air" ]]; then
  CASKS += ( chatgpt iina spotify sweet-home3d )
elif [[ $machine == "WKMZTAFD6544" ]]; then
  CASKS += ( intellij-idea slack )
fi

# install casks
for c in "${CASKS[@]}"; do
  cask-install "$c" 
done
