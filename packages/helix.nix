{ config, lib, pkgs, ... }:{
  options.packages.helix.enable = lib.mkEnableOption "helix";

  config = lib.mkIf config.packages.helix.enable {
    environment.systemPackages = with pkgs; [ helix ];
  };
}
