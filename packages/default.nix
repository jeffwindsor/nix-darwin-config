{ pkgs, ... }: {

  imports = [
    ./modules
    ./bundles
  ];

  config = {
    # Enabling packages default
    # using module options declared ./modules/<package-name>.nix
    packages = {
      firefox = true;
      git = true;
      # google-chrome = true;
      helix = true;
      modern-cli-tools = true;
      nushell = true;
      television = true;
      zed-editor = true;
      zsh = true;
      
      jetbrains-mono-nerd-font = true;
    };

  };

}
