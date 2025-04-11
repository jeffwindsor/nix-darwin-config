{ lib, pkgs, ... }:{

  environment.systemPackages = with pkgs;[
    vlc
    # chatgpt
    spotify  # Music player
    # steam-run  # steam gaming client
    # sweethome3d.application
    # transmission
  ];
  
}

# https://discourse.nixos.org/t/one-single-configuration-for-multiple-architectures/29879/3
