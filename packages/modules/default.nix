{ pkgs, ... }: {
  # imports all *.nix in this folder
  # higher level modules can set config to turn packages on
  imports = [
    
    ./firefox.nix
    ./git.nix
    ./google-chrome.nix
    ./jetbrains-mono-nerd-font.nix
    ./helix.nix
    ./modern-cli-tools.nix
    ./nushell.nix
    ./television.nix
    ./zed-editor.nix
    ./zsh.nix

  ];
}
