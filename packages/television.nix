{ config, lib, pkgs, ... }:{

  options.packages.television.enable = lib.mkEnableOption "television";

  config = lib.mkIf config.packages.television.enable {
    environment.systemPackages = with pkgs; [
      television
      nix-search-tv
    ];
  };
}
