# jetbrains-mono-nerd-font
{ config, lib, pkgs, ... }:{

  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.jetbrains-mono-nerd-font = lib.mkEnableOption "font nerd.fonts.jetbrains-mono";

  config = lib.mkIf config.packages.jetbrains-mono-nerd-font {
    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        atkinson-monolegible
    ];
  };
}

