{ config, lib, pkgs, ... }:{
  options.packages.firefox.enable = lib.mkEnableOption "firefox";

  config = lib.mkIf config.packages.firefox.enable {
    environment.systemPackages = with pkgs; [ firefox ];
  };
}
