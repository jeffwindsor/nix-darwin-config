{ pkgs, ... }: {

  # the idea here is to import all the package modules and then
  # enable what you need somewhere else.  This avoids using home-manager
  imports = [
    ./chatgpt.nix 
    ./direnv.nix
    ./firefox.nix
    ./ghostty.nix 
    ./git.nix
    ./google-chrome.nix
    ./helix.nix
    ./jetbrains.idea-ultimate.nix 
    ./maven.nix
    ./modern-cli-tools.nix
    ./mono-fonts.nix
    ./network-utils.nix 
    ./nushell.nix
    ./slack.nix
    ./spotify.nix
    ./television.nix
    ./zed-editor.nix 
    ./zsh.nix
  ];

}
