{ ... }:{

  # ===========================================================================
  # nix options: https://nixos.org/manual/nixpkgs/unstable/#sec-config-options-reference
  # ===========================================================================

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnFree = true;

  # ===========================================================================
  # nix darwin options: https://daiderd.com/nix-darwin/manual/index.html
  # ===========================================================================
  
  # sudo via finger print scan
  security.pam.enableSudoTouchIdAuth = true;

  # Used for backwards compatibility, please read the changelog before changing.
  system.stateVersion = 5;
  
}
