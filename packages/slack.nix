{ config, lib, pkgs, ... }:{
  options.packages.slack.enable = lib.mkEnableOption "slack";

  config = lib.mkIf config.packages.slack.enable {
    environment.systemPackages = with pkgs; [ slack ];
  };
}
