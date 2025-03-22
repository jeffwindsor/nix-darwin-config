# Aqua is the macOS desktop
{ pkgs, config, ... }:{

  environment.systemPackages = with pkgs; [
    aerospace      # tiling, workspaces, and launcher
    mas            # apple store cli
  ];

  homebrew.casks = [
    "jordanbaird-ice"  # bar icon manager
    "keepingyouawake"  # like caffiene
    "zen-browser"      # browser
    "ghostty"          # currently broken package 2025-03-17
  ];

  # ===========================================================================
  # nix darwin macos options: https://daiderd.com/nix-darwin/manual/index.html#opt-system.defaults._.GlobalPreferences_._com.apple.mouse.scaling_
  # ===========================================================================
  system.defaults = {

    dock = {
      autohide = true;
      autohide-delay = 0.0;  # remove delay for showing dock
      largesize = 128;       # icon size on magnification
      launchanim = false;    # Animate Opening Applications
      magnification = true;
      orientation = "right";
      show-recents = false;
    };
    
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXDefaultSearchScope = "SCcf";  # search targets current folder
      ShowPathbar = true;
      _FXShowPosixPathInTitle = true;
      _FXSortFoldersFirstOnDesktop = true;
    };

    loginwindow.GuestEnabled = false;

    NSGlobalDomain.AppleInterfaceStyle = "Dark";
  };
  
}
