{ config, lib, pkgs, ... }:{
  options.packages.chatgpt.enable = lib.mkEnableOption "chatgpt";

  config = lib.mkIf config.packages.chatgpt.enable {
    environment.systemPackages = with pkgs; [ chatgpt ];
  };
}
