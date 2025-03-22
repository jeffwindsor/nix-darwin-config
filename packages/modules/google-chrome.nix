{ config, lib, pkgs, ... }:{

  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.google-chrome = lib.mkEnableOption "google-chrome";

  config = lib.mkIf config.packages.google-chrome {
    environment.systemPackages = with pkgs; [ google-chrome ];
  };
}
