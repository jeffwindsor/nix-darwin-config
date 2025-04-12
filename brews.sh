#!/usr/bin/env bash
brew_command="${1:-install}"  # reinstall, info, etc..


# install brew if missing
if ! command -v brew &> /dev/null; then
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# CLI and TUI
FORMULAE=(
  bash
  bat
  eza
  fd
  fzf
  git
  helix
  lazygit
  ripgrep
  sd
  starship
  stow
  television
  yazi
  zsh
)

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
  zed
  zen-browser
)

# add machine specific packages
machine=$(networksetup -getcomputername)
if [[ $machine == "Midnight-Air" ]]; then
  CASKS=(
    "${CASKS[@]}"
    chatgpt
    iina
    spotify
    sweet-home3d
  )
fi

[[ $machine == "WKMZTAFD6544" ]]; thenCASKS=(
  "${CASKS[@]}"
  intellij-idea
  slack
)


# install casks
# echo "\e[94m $machine ==> ${CASKS[@]} \e[0m"
function install(){
  echo -e "\e[94m==> Brew Install $@ <==\e[0m"
  brew $brew_command "$@"
}

for c in "${CASKS[@]}"; do install --cask "$c"; done
for f in "${FORMULAE[@]}"; do install --formulae "$f"; done
