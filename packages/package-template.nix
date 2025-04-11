{ config, lib, pkgs, ... }:{
  options.packages.{package_name}.enable = lib.mkEnableOption "{package_name}";

  config = lib.mkIf config.packages.{package_name}.enable {
    environment.shells = with pkgs; [ {package_name} ];
  };
}
