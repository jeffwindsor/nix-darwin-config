{ config, lib, pkgs, ... }:{
  options.packages.maven.enable = lib.mkEnableOption "maven";

  config = lib.mkIf config.packages.maven.enable {
    environment.systemPackages = with pkgs; [ maven ];
  };
}
