{ config, lib, pkgs, ... }:{
  

  options.packages.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf config.packages.git.enable {
    environment.systemPackages = with pkgs; [
      git
      lazygit # tui for git
      stow  # used for dotfiles
    ];
  };
}
