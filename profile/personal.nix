{ lib, pkgs, ... }:{

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
  
}
