{ config, lib, pkgs, ... }:{

  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.zed-editor = lib.mkEnableOption "zed-editor";

  config = lib.mkIf config.packages.zed-editor {
    environment.systemPackages = with pkgs; [ zed-editor ];
  };
}
