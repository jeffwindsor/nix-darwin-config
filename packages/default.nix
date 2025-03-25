# Root file for packages and bundles
{ pkgs, ... }: {

  # the idea here is to import all the nix file content and then only enable what you need
  imports = [
    ./modules
    ./bundles
  ];

  # My Minimum Viable Setup
  config = {

    bundles.modern-cli-tools.enable = true;

    packages = {
      firefox.enable = true;
      google-chrome.enable = true;

      git.enable = true;
      
      helix.enable = true;
      zed-editor.enable = true;
      
      nushell.enable = true;
      zsh.enable = true;
    };

    # fonts (not converted to separate nix files for now)
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      atkinson-monolegible
    ];
  };

}
