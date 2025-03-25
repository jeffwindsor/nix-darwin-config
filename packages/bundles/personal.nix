{ config, lib, pkgs, ... }:{
  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.bundles.personal.enable = lib.mkEnableOption "Personal Use Bundle";

  config = lib.mkIf config.bundles.personal.enable {

    environment.systemPackages = with pkgs;[
      iina  # Modern media player for macOS
      chatgpt
      spotify  # Music player
      # steam-run  # steam gaming client
      sweethome3d.application
      # transmission
    ];

    homebrew = lib.mkIf (pkgs.stdenv.hostPlatform == "aarch64-darwin") {
      casks = [ "balenaetcher" ];
  
      masApps = {
        "DaisyDisk" = 411643860;
        "Amazon Prime Video" = 545519333;
      };
      
    };
  };
}
