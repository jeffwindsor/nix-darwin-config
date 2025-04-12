{ config, lib, pkgs, ... }:{
  options.packages.nyxt.enable = lib.mkEnableOption "nyxt";

  config = lib.mkIf config.packages.nyxt.enable {
    environment.systemPackages = with pkgs; [ nyxt ];
  };
}
