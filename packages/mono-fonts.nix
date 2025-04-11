{ config, lib, pkgs, ... }:{
  options.packages.mono-fonts.enable = lib.mkEnableOption "mono-fonts";

  config = lib.mkIf config.packages.mono-fonts.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      atkinson-hyperlegible-mono
    ];
  };
}
