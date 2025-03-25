{ config, lib, pkgs, ... }:{

  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.google-chrome.enable = lib.mkEnableOption "google-chrome";

  config = lib.mkIf config.packages.google-chrome.enable {
    environment.systemPackages = with pkgs; [ google-chrome ];
  };
}
