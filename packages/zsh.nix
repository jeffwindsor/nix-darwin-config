{ config, lib, pkgs, ... }:{
  options.packages.zsh.enable = lib.mkEnableOption "zsh";

  config = lib.mkIf config.packages.zsh.enable {
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
