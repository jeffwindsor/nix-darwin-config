{ config, lib, pkgs, ... }:{

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
