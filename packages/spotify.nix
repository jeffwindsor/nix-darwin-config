{ config, lib, pkgs, ... }:{
  options.packages.spotify.enable = lib.mkEnableOption "spotify";

  config = lib.mkIf config.packages.spotify.enable {
    environment.systemPackages = with pkgs; [ spotify ];
  };
}
