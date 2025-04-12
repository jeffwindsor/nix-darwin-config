{ config, lib, pkgs, ... }:{
  options.packages.jetbrains.idea-ultimate.enable = lib.mkEnableOption "jetbrains.idea-ultimate";

  config = lib.mkIf config.packages.jetbrains.idea-ultimate.enable {
    environment.systemPackages = with pkgs; [ jetbrains.idea-ultimate ];
  };
}
