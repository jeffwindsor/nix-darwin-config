{ ... }:{

  # ===========================================================================
  # nix options: https://nixos.org/manual/nixpkgs/unstable/#sec-config-options-reference
  # ===========================================================================

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnFree = true;

  # ===========================================================================
  # nix darwin options: https://daiderd.com/nix-darwin/manual/index.html
  # ===========================================================================
  
  homebrew.enable = true;
  homebrew.onActivation = {
    cleanup = "zap";    # will remove any brews not specified in a nix file
    autoUpdate = true;
    upgrade = true;
  };

  # sudo via finger print scan
  security.pam.services.sudo_local.touchIdAuth = true;

  # Used for backwards compatibility, please read the changelog before changing.
  system.stateVersion = 6;
  
}
