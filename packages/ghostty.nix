{ config, lib, pkgs, ... }:{
  options.packages.ghostty.enable = lib.mkEnableOption "ghostty";

  config = lib.mkIf config.packages.ghostty.enable {
    environment.shells = with pkgs; [ ghostty ];
  };
}
