{ config, lib, pkgs, ... }:{

  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.zsh = lib.mkEnableOption "zsh";

  config = lib.mkIf config.packages.zsh {
    # add to available shells
    environment.shells = with pkgs; [ zsh ];
  
    # add package 
    environment.systemPackages = with pkgs; [
      zsh
    ];
  
    # enable zsh
    programs.zsh.enable = true;
  };
}
