{ config, lib, pkgs, ... }:{

  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.firefox = lib.mkEnableOption "firefox";

  config = lib.mkIf config.packages.firefox {
    environment.systemPackages = with pkgs; [ firefox ];
  };
}
