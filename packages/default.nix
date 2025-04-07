# Root file for packages and bundles
{ pkgs, ... }: {

  # the idea here is to import all the nix file content and then only enable what you need
  imports = [
    ./direnv.nix
    ./firefox.nix
    ./git.nix
    ./google-chrome.nix
    ./helix.nix
    ./modern-cli-tools.nix
    ./network-utils.nix 
    ./nushell.nix
    ./television.nix
    ./zsh.nix
  ];

  # My Minimum Viable Setup
  config = {

    packages = {
      # firefox.enable = true;
      # google-chrome.enable = true;

      git.enable = true;
      modern-cli-tools.enable = true;      
      helix.enable = true;
      
      # nushell.enable = true;
      zsh.enable = true;
      # direnv.enable = true;
    };

    # fonts (not converted to separate nix files for now)
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      atkinson-hyperlegible-mono
    ];
  };

}
