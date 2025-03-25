{ config, lib, pkgs, ... }:
let
  is_enabled = config.packages.zed-editor.enable;
  is_darwin = (pkgs.stdenv.hostPlatform != "aarch64-darwin");
in {

  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.zed-editor.enable = lib.mkEnableOption "zed-editor";

  # no real mkIfElse, so using a merge on a case-like set of MkIfs
  config = lib.mkMerge [
    # darwin - use homebrew for now
    (lib.mkIf (is_darwin && is_enabled) { homebrew.casks = [ "zed" ]; })
    # else use nix package
    (lib.mkIf (!is_darwin && is_enabled) { environment.systemPackages = [ pkgs.zed-editor ]; })
  ];
}
