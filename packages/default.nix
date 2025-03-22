{ pkgs, ... }: {
  # Root file for packages and bundles
  # Import everything as a template
  # What gets installed only what is enabled 
  imports = [
    ./modules
    ./bundles
  ];

  config = {
    # Minimum Viable Setup
    packages = {
      firefox = true;
      git = true;
      helix = true;
      modern-cli-tools = true;
      television = true;
      zed-editor = true;
      zsh = true;
      jetbrains-mono-nerd-font = true;
    };

  };

}
