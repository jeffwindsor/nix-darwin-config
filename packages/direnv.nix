{ config, lib, pkgs, ... }:{
  options.packages.direnv.enable = lib.mkEnableOption "direnv";

  config = lib.mkIf config.packages.direnv.enable {
    environment.systemPackages = with pkgs; [ direnv ];
  };
}

