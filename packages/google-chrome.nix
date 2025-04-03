{ config, lib, pkgs, ... }:{
  options.packages.google-chrome.enable = lib.mkEnableOption "google-chrome";

  config = lib.mkIf config.packages.google-chrome.enable {
    environment.systemPackages = with pkgs; [ google-chrome ];
  };
}
