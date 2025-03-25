{ config, lib, pkgs, ... }:{
  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.nushell.enable = lib.mkEnableOption "nushell";

  config = lib.mkIf config.packages.nushell.enable {

    # add to available shells
    environment.shells = with pkgs; [ nushell ];
  
    # add package 
    environment.systemPackages = with pkgs; [
      nushell
    ];

  };
}
