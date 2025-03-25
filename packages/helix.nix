{ config, lib, pkgs, ... }:{

  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.helix.enable = lib.mkEnableOption "helix";

  config = lib.mkIf config.packages.helix.enable {
    environment.systemPackages = with pkgs; [ helix ];
  };
}
