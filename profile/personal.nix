{ lib, pkgs, ... }:{

  environment.systemPackages = with pkgs;[
    iina  # Modern media player for macOS
    chatgpt
    spotify  # Music player
    # steam-run  # steam gaming client
    sweethome3d.application
    # transmission
  ];
  
}
