{ config, lib, pkgs, ... }:{
  options.packages.devenv.enable = lib.mkEnableOption "devenv";

  config = lib.mkIf config.packages.devenv.enable {
    environment.shells = with pkgs; [ devenv ];
  };
}
