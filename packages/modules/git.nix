{ config, lib, pkgs, ... }:{
  
  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.git = lib.mkEnableOption "git";

  config = lib.mkIf config.packages.git {
    environment.systemPackages = with pkgs; [
      git
      lazygit # tui for git
      stow  # used for dotfiles
    ];
  };
}
