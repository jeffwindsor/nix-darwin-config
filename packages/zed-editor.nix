{ config, lib, pkgs, ... }:{
  options.packages.zed-editor.enable = lib.mkEnableOption "zed-editor";

  config = lib.mkIf config.packages.zed-editor.enable {
    environment.systemPackages = with pkgs; [ zed-editor ];
  };
}
