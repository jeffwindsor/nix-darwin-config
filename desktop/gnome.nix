{ pkgs, lib, ... }:{

  services.flatpak.enable = true;                   # enable flatpak usage

  # Add packages I like with Gnome
  environment.systemPackages = (with pkgs; [
    clifm                    # CLI-based, shell-like, terminal file manager
  
    ghostty                  # terminal
    gnome-extension-manager  # improved extension manager
    gnome-firmware           # firmware application
    seahorse                 # manage encryption keys and passwords in the GnomeKeyring
    wl-clipboard             # wayland cli clipboard enabler
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator             # shows old-school icons in tray (some programs need this, like mega sync)
    blur-my-shell            # add some modern blurrrr
    caffeine                 # stay awake
    executor                 # run commands, output to bar
    forge                    # tiling window manager
    just-perfection          # tweaks to gnome visuals
    launch-new-instance      # when launching apps create a new instance
    wallpaper-slideshow      # auto switch wallpapers
    weather-or-not           # weather in the taskbar
  ]);

  # Exclude Packages from Gnome Derivation that I do not want
  environment.gnome.excludePackages = with pkgs; [
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    geary # email reader
    gedit # text editor
    gnome-characters
    gnome-initial-setup
    gnome-maps
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour # gnome first install tour
    totem # video player
    yelp  # Help view
  ];

  # Add the games pack
  # services.gnome.games.enable = true;

  # custom settings
  programs.dconf.profiles = {
    user.databases = [{
      settings = with lib.gvariant; {

        "org/gnome/desktop/calendar".show-weekdate = true;

        "org/gnome/desktop/datetime".automatic-timezone = true;

        "org/gnome/desktop/interface" = {
        	clock-format = "'12h'";
        	clock-show-weekday = true;
        	color-scheme = "'prefer-dark'";
        	gtk-theme = "'Adwaita-dark'";
        	locate-pointer = true;
        	text-scaling-factor = "1.25";
        };

        "org/gnome/desktop/peripherals/touchpad" = {
        	click-method = "'fingers'";
        	natural-scroll = true;
        	speed = "0.4";
        	two-finger-scrolling-enabled = true;
        };

        "org/gnome/desktop/wm/keybindings" = {
          close = "['<Super>q']";
          minimize = "['<Super>w']";
          move-to-workspace-1 = "['<Super><Control>1']";
          move-to-workspace-10 = "['<Super><Control>0']";
          move-to-workspace-2 = "['<Super><Control>2']";
          move-to-workspace-3 = "['<Super><Control>3']";
          move-to-workspace-4 = "['<Super><Control>4']";
          move-to-workspace-5 = "['<Super><Control>5']";
          move-to-workspace-6 = "['<Super><Control>6']";
          move-to-workspace-7 = "['<Super><Control>7']";
          move-to-workspace-8 = "['<Super><Control>8']";
          move-to-workspace-9 = "['<Super><Control>9']";
          panel-run-dialog = "['<Control>space']";
          switch-input-source = "@as []";
          switch-input-source-backward = "@as []";
          switch-to-workspace-1 = "['<Super>1']";
          switch-to-workspace-10 = "['<Super>0']";
          switch-to-workspace-2 = "['<Super>2']";
          switch-to-workspace-3 = "['<Super>3']";
          switch-to-workspace-4 = "['<Super>4']";
          switch-to-workspace-5 = "['<Super>5']";
          switch-to-workspace-6 = "['<Super>6']";
          switch-to-workspace-7 = "['<Super>7']";
          switch-to-workspace-8 = "['<Super>8']";
          switch-to-workspace-9 = "['<Super>9']";
          toggle-fullscreen = "['<Super><Control>m']";
        };

        "org/gnome/desktop/wm/preferences" = {
          button-layout = "'close:appmenu'";
          num-workspaces = "10";
        };

        "org/gnome/mutter" = {
          dynamic-workspaces = false;
          workspaces-only-on-primary = true;
        };

        "org/gnome/mutter/keybindings" = {
          toggle-tiled-left = [];
          toggle-tiled-right = [];
        };

        "org/gnome/nautilus/preferences".default-folder-viewer = "'list-view'";

        "org/gtk/gtk4/settings/file-chooser".show-hidden = true;

        "org/gtk/settings/file-chooser".clock-format = "'12h'";
        
        "org/gnome/shell/keybindings" = {
          focus-active-notification = [];
          show-screenshot-ui = "['<Control>grave']";
          switch-to-application-1 = [];
          switch-to-application-10 = [];
          switch-to-application-2 = [];
          switch-to-application-3 = [];
          switch-to-application-4 = [];
          switch-to-application-5 = [];
          switch-to-application-6 = [];
          switch-to-application-7 = [];
          switch-to-application-8 = [];
          switch-to-application-9 = [];
          toggle-message-tray = [];
        };

        "org/gnome/settings-daemon/plugins/media-keys" = {
          control-center = "['<Super>comma']";
          home =  "['<Super>f']";
          next =  "['AudioForward']";
          previous =  "['AudioRewind']";
          www =  "['<Super>b']";
        };



        "org/gnome/shell".enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
          "caffeine@patapon.info"
          # "executor@raujonas.github.io"
          "forge@jmmaranan.com"
          "just-perfection-desktop@just-perfection"
          "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
          # "wallpaper-slideshow@"
          # "weather-or-not@"
        ];

        "org/gnome/shell/extensions/caffeine".toggle-shortcut = "['<Super>Delete']";
        
        "org/gnome/shell/extensions/executor" = {
          center-active = false;
          left-index = "3";
          right-active = false;
        };
        
        "org/gnome/shell/extensions/forge/frequency" = {
          tiling-mode-enabled = true;
          window-gap-size-increment = "1";
        };

        "org/gnome/shell/extensions/just-perfection" = {
          accessibility-menu = false;
          activities-button = false;
          app-menu-label = false;
          startup-status = "0";
        };
      };
    }];
  };

  # Enable GDM and GNOME
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

}

# example declarative gnome: https://github.com/Electrostasy/dots/blob/c62895040a8474bba8c4d48828665cfc1791c711/profiles/system/gnome/default.nix#L123-L287
# https://determinate.systems/posts/declarative-gnome-configuration-with-nixos/
