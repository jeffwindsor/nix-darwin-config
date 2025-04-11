{ config, lib, pkgs, ... }:{
  options.packages.fonts.enable = lib.mkEnableOption "mono-fonts";

  config = lib.mkIf config.packages.fonts.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      atkinson-hyperlegible-mono
    ];
  };
}
