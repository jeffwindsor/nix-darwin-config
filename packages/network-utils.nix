{ config, lib, pkgs, ... }:{
  
  options.packages.network-utils.enable = lib.mkEnableOption "network-utils";

  config = lib.mkIf config.packages.network-utils.enable {
    environment.systemPackages = with pkgs; [
      doggo    # dig replacement: Command-line DNS Client for Humans. 
      gping    # Ping, but with a graph
    ];
  };
}

